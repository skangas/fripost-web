EMACS=emacs -q --no-site-file

all:	fripost-web

fripost-web:
	$(EMACS) -batch -L . \
		-l "fripost-web.el" \
		-eval "(org-publish-project \"fripost-web\")"
