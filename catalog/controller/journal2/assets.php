<?php
class ControllerJournal2Assets extends Controller {

    protected $data = array();

    protected function render() {
        return Front::$IS_OC2 ? $this->load->view($this->template, $this->data) : parent::render();
    }

    public function css() {
        if (!$this->journal2->cache->getDeveloperMode() && $this->journal2->minifier->getMinifyCss()) {
            $file = $this->journal2->cache->getCachePath() . $this->journal2->cache->getJournalAssetsFileName('css');
            if (!file_exists($file)) {
                $this->data['selectors'] = $this->journal2->css_settings;
                $this->template = $this->config->get('config_template') . '/template/journal2/assets/css.tpl';
                file_put_contents($file, $this->render(), LOCK_EX);
            }
        } else {
            $this->data['selectors'] = $this->journal2->css_settings;
            $this->template = $this->config->get('config_template') . '/template/journal2/assets/css.tpl';
            $this->response->addHeader('Content-type: text/css');
            $this->response->setOutput($this->render());
        }
    }

    public function js() {
        // mm fix
        $force_minify_off = strpos(Journal2Utils::getProperty($this->request->server, 'HTTP_REFERER'), 'route=seller/') !== FALSE;

        if (!$force_minify_off && !$this->journal2->cache->getDeveloperMode() && $this->journal2->minifier->getMinifyJs()) {
            $file = $this->journal2->cache->getCachePath() . $this->journal2->cache->getJournalAssetsFileName('js');
            if (!file_exists($file)) {
                $this->template = $this->config->get('config_template') . '/template/journal2/assets/js.tpl';

                $content_min = JSMin::minify($this->render());

                file_put_contents($file, $content_min, LOCK_EX);
            }
        } else {
            $this->template = $this->config->get('config_template') . '/template/journal2/assets/js.tpl';
            $this->response->addHeader('Content-type: application/javascript');
            $this->response->setOutput($this->render());
        }
    }

}
