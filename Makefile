MY_JEKYLL_GITHUB_TOKEN = $(shell echo $(JEKYLL_GITHUB_TOKEN))

all: push
push: commit
	git submodule foreach git push
commit: sync
	git submodule foreach git ci -s -m "Update `date +%Y-%m-%d`" --allow-empty
sync: build
	rsync -au --exclude '.git*' --delete \
	  _site/tdiary-style-org/ submodules/tdiary-style-org/
build: clean
	JEKYLL_GITHUB_TOKEN=$(MY_JEKYLL_GITHUB_TOKEN) \
	  bundle exec jekyll build
clean:
	bundle exec jekyll clean
