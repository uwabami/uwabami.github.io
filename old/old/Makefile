PUBDIR := /GFD_Dennou_Club/ftp/arch/uwabami
all: build
prepare:
	./rss2js.rb > js/diary.js
publish: prepare
	bundle exec jekyll build --config _config.yml,_config_publish.yml -d $(PUBDIR)/

build: prepare
	rsync -au bootstrap Github
	rsync -au js --exclude 'diary.js' Github
	bundle exec jekyll build
	rsync -au _site/css Github
	bundle exec jekyll build

server: build
	bundle exec jekyll server -w --trace

preview: server

clean:
	@find _site -type f | egrep -v Github | egrep -v .gitkeep | xargs rm -fv
	@find _site -type d -empty | xargs rmdir -v
