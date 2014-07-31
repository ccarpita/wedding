.PHONY: setup build watch publish

setup:
	git submodule init
	git submodule update

build: setup
	cp vendor/lightbox2/img/*.png src/public/assets/img
	cp vendor/lightbox2/img/loading.gif src/public/assets/img
	cp vendor/lightbox2/css/*.css src/public/assets/css
	cp vendor/lightbox2/js/jquery-1.10.2.min.js  src/public/assets/js
	cp vendor/lightbox2/js/lightbox-2.6.min.js src/public/assets/js

publish:
	rsync -rav --exclude vendor --exclude .git . dpitawedding.com:dpitawedding.com

watch:
	cd src/public && python -mSimpleHTTPServer 8000

update-hook:
	node src/update-hook/app.js 1>/var/log/dpitawedding/update-hook.log 2> /var/log/dpitawedding/update-hook.err.log </dev/null &
