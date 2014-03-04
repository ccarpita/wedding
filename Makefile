.PHONY: watch publish

watch:
	python -mSimpleHTTPServer

publish:
	rsync -rav --exclude .git . dpitawedding.com:dpitawedding.com
