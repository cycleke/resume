empty: clean en zh bi

en: resume-en.tex
	xelatex --shell-escape resume-en.tex
zh: resume-zh.tex
	xelatex --shell-escape resume-zh.tex
bi: resume-bi.tex
	xelatex --shell-escape resume-bi.tex

clean:
	@echo Done.
	-find -name '*.aux' -exec rm -f {} \;
	-find -name '*.bak' -exec rm -f {} \;
	-find -name '*.dvi' -exec rm -f {} \;
	-find -name '*~' -exec rm -f {} \;
	-find -name '#*#' -exec rm -f {} \;
	-find -name 'semantic.cache' -exec rm -f {} \;
	-find -name '*.log' -exec rm -f {} \;
	-rm -f *.bbl *.blg *.log *.out *.ps *.thm *.toc *.toe *.lof *.lot *.nav *.snm *.vrb
	-rm -f *.loa *.aen
	-rm -f *.html *.css *.scm *.hlog
	-rm -f _region_.tex
	-rm -f -rf auto
	-rm -f *.fen
	-rm -f *.ten
	-rm -f *.bcf
	-rm -f *.pyg
	-rm -f *.xml
	-rm -rf *.prv

clean-tex:
	-rm resume-en.tex resume-zh.tex resume-bi.tex
