EMACS=emacs -q --no-site-file

usage:
	@echo "usage: make fripost-web will publish the site to publish/"
	@echo "       make usage displays this message."
	@echo

all:
	make fripost-web

fripost-web:
	$(EMACS) -batch -L . \
		-l "fripost-web.el" \
		-eval "(org-publish-project \"fripost-web\")"
