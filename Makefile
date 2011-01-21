EMACS=emacs -q --no-site-file

all:	fripost-web

fripost-web:
	$(EMACS) -batch -L . \
		-l "fripost-web.el" \
		-eval "(org-publish-project \"fripost-web\")"
	# UGLY HACK
	find publish -iname "*.html" -exec perl -pi -e 's!\\ndash!&ndash;!' {} \;
	# Remove Emacs backup files
	find publish -name "*~" -delete
