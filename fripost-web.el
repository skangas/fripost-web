(require 'org-publish)

(setq org-publish-project-alist
      `(
        ("fripost-web-pages"
         :base-directory ,default-directory
         :base-extension "org"
         :publishing-directory ,(concat default-directory "/publish/")
         :exclude "/publish/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :preamble "<div class=\"header\">
  <h1>Fripost</h1>
<a href=\"index.en.html\" class=\"translate\">Click here for English</a>
</div>

<div class=\"navigation\">
  <a href=\"index.html\">Hem</a>
  <a href=\"organisation.html\">Om</a>
  <a href=\"faq.html\">FAQ</a>
  <a href=\"medlemskap.html\">Gå med</a>
  <a href=\"kontakt.html\">Kontakt</a>
<div class=\"clearer\"><span></span></div>
</div>

<div class=\"container\">
<div class=\"content\">"
         :postamble "<div class=\"divider\"></div>

<div class=\"footer\">
  <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-sa/2.5/se/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"http://i.creativecommons.org/l/by-sa/2.5/se/80x15.png\" /></a><br /><span xmlns:dct=\"http://purl.org/dc/terms/\">This website</span> by <a xmlns:cc=\"http://creativecommons.org/ns#\" href=\"http://fripost.org/\" rel=\"cc:attributionURL\">Fripost - föreningen för fri e-post</a> is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-sa/2.5/se/\">Creative Commons Attribution-ShareAlike 2.5 Sweden License</a>.<br />
  Valid <a href=\"http://jigsaw.w3.org/css-validator/check/referer\">CSS</a> &amp; <a href=\"http://validator.w3.org/check?uri=referer\">XHTML</a>. Design by <a href=\"http://arcsin.se\">Arcsin</a>
</div>

</div>
</div>"
         :auto-preamble nil
         :auto-postamble nil
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )

        ("fripost-web-static"
         :base-directory ,default-directory
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg"
         :publishing-directory ,(concat default-directory "/publish/")
         :exclude "/publish/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("fripost-web" :components ("fripost-web-pages" "fripost-web-static"))
      ))

;; M-x org-publish-project RET fripost-web
