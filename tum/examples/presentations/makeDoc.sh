latexmk -pdf minimal.tex
latexmk -pdf minimal_wo_titlegraphic.tex
latexmk -pdf minimal_handout.tex
latexmk -pdf -shell-escape -interaction=nonstopmode main.tex
