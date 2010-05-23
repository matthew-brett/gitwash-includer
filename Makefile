# Makefile targets you might like to include in your project's doc Makefile
# See: http://www.kernel.org/pub/software/scm/git/docs/howto/using-merge-subtree.html
GITWASH_BRANCH=for-ipython
GITWASH_URL=git://github.com/matthew-brett/gitwash.git
GITWASH_OUTPUT_DIR=my_gitwash

gitwash-init:
	git remote add -f gitwash $(GITWASH_URL)
	git merge -s ours --no-commit gitwash/$(GITWASH_BRANCH)

gitwash-first-time: gitwash-init
	git read-tree --prefix=$(GITWASH_OUTPUT_DIR)/ -u gitwash/$(GITWASH_BRANCH)
	git commit -m "Merge gitwash docs as subdirectory"

update-gitwash:
	git pull -s subtree gitwash $(GITWASH_BRANCH)