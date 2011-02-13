EMACS=emacs -q --no-site-file

all:	fripost-web

fripost-web: # creates home page
	$(EMACS) -batch -L . \
		-l "fripost-web.el" \
		-eval "(org-publish-project \"fripost-web\")"
	# UGLY HACK
	find publish -iname "*.html" -exec perl -pi -e 's!\\ndash!&ndash;!' {} \;
	# Remove Emacs backup files
	find publish -name "*~" -delete

send: # sends to fripost.org for publication
	rsync -ruvp publish/ fripost@fripost.org/fripost.org/

clean:
	rm *~*; rm test test.d/test; rmdir test.d

# Debuging and testing
send-test: test.d/test
	rsync -ruvp test.d/ fripost@fripost.org:fripost.org/

test.d/test: test.d
	echo This is the test file for fripost-web. > test.d/test
test.d:
	mkdir test.d


