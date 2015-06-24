# need to copy LESS-processed css back here to push to github
build:
	jekyll build
	cp -r _site/css ./

serve:
	jekyll serve --watch --baseurl=

css/style.css: css/style.less ../bootstrap
	lessc $< > $@

bootstrap/fonts/glyphicons-halflings-regular.woff: ../$@
	cp $^ $@
