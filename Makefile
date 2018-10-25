all: preview

build:
	env ORG_RUBY_ENABLE_INCLUDE_FILES=true \
	  bundle exec jekyll b --watch --incremental
preview:
	env ORG_RUBY_ENABLE_INCLUDE_FILES=true \
	  bundle exec jekyll s --watch --incremental
deploy:
	scripts/build.sh
