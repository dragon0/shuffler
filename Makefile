GHP_SRC=dist
#GHP_DEST=docs
GHP_PUSH=yes

gh-pages: gh-pages-clean
gh-pages: build

include gh-pages.Makefile


%:
	npm run $@

