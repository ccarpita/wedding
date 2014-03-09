.PHONY: setup build watch publish

setup:
	git submodule init
	git submodule update

build: setup
	cp vendor/lightbox2/img/*.png assets/img
	cp vendor/lightbox2/img/loading.gif assets/img
	cp vendor/lightbox2/css/*.css assets/css
	cp vendor/lightbox2/js/jquery-1.10.2.min.js  assets/js
	cp vendor/lightbox2/js/lightbox-2.6.min.js assets/js

publish:
	rsync -rav --exclude vendor --exclude .git . dpitawedding.com:dpitawedding.com

watch:
	python -mSimpleHTTPServer

