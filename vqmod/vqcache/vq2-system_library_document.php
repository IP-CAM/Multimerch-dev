<?php
class Document {
	private $title;
	private $description;
	private $keywords;
	private $links = array();
	private $styles = array();
	private $scripts = array();

                private $metaProperties = array();
                private $metaTags = array();

                public function addMetaProperty(array $property) {
                    $this->metaProperties[md5($property['type'])] = array(
                        'type'    => $property['type'],
                        'content' => $property['content'],
                    );
                }
                public function addMetaProperties(array $metaProperties) {
                    foreach ($metaProperties as $property) {
                        $this->addMetaProperty($property);
                    }
                }
                public function getMetaProperties() {
                    return $this->metaProperties;
                }
                public function addMetaTag(array $tag) {
                    $this->metaTags[md5($tag['name'])] = array(
                        'name'    => $tag['name'],
                        'content' => $tag['content'],
                    );
                }
                public function addMetaTags(array $tags) {
                    foreach ($tags as $tag) {
                        $this->addMetaTag($tag);
                    }
                }
                public function getMetaTags() {
                    return $this->metaTags;
                }
            

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getKeywords() {
		return $this->keywords;
	}

	public function addLink($href, $rel) {
		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	public function getLinks() {
		return $this->links;
	}

	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	public function getStyles() {
		return $this->styles;
	}

	public function addScript($href, $postion = 'header') {
		$this->scripts[$postion][$href] = $href;
	}

	public function getScripts($postion = 'header') {
		if (isset($this->scripts[$postion])) {
			return $this->scripts[$postion];
		} else {
			return array();
		}
	}
}
