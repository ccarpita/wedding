.PHONY: watch publish

watch:
	python -mSimpleHTTPServer

publish:
	rsync -rav . dpitawedding.com:dpitawedding.com
