MY_JEKYLL_GITHUB_TOKEN = $(shell echo $(JEKYLL_GITHUB_TOKEN))

all: build
push: build
	git submodule foreach git push
	git add .
	git commit -s -m "Update submodules `date '+%Y-%m-%d %H:%M:%S'`"
	git push
preview: server
server: build
	JEKYLL_GITHUB_TOKEN=$(MY_JEKYLL_GITHUB_TOKEN) \
	  bundle exec jekyll serve --watch --safe
build: publish
	JEKYLL_GITHUB_TOKEN=$(MY_JEKYLL_GITHUB_TOKEN) \
	  bundle exec jekyll build --safe
publish:
	emacs -l ~/.emacs.d/init.elc --batch \
	  --eval '(org-publish-project "web")'
	emacs -l ~/.emacs.d/init.elc --batch \
	  --eval '(org-publish-project "cc-env")'
	find cc-env -name \*.html | \
	  xargs sed -i -e 's%../../.emacs.d/README.html%Emacs.html%g'
	find cc-env -name \*.html | \
	  xargs sed -i -e 's%file:///home/uwabami/.emacs.d/README.html%Emacs.html%g'
clean:
	bundle exec jekyll clean
