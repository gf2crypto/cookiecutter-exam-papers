TEX_SOURCE := {{cookiecutter.project_name}}

PROGRAM := latexmk
VIEWPDFPARAM = -pv
BUILDPARAM = -cd -f -pdf -interaction=nonstopmode -synctex=1
WATCHPARAM = -pvc -f -pdf -interaction=nonstopmode -synctex=1
TEMP_FILES = *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.xdv

.PHONY: build
build: $(TEX_SOURCE).a6paper.pdf
	$(PROGRAM) $(VIEWPDFPARAM) $(BUILDPARAM) $(TEX_SOURCE).tex

.PHONY: watch
watch: $(TEX_SOURCE).a6paper.pdf
	$(PROGRAM) $(WATCHPARAM) $(TEX_SOURCE).tex

.PHONY: clean
clean:
	rm -rf $(TEMP_FILES)

.PHONY: purge
purge: clean
	rm -rf $(TEX_SOURCE).pdf $(TEX_SOURCE).a6paper.pdf

.PHONY: help
help:
	@printf "Usage: make [options] [target] ...\n"
	@printf "\n"
	@printf "Valid targets:\n"
	@printf "\n"
	@printf "    build              compile the tex-source (default parameter)\n"
	@printf "    watch              compile the tex-source continously\n"
	@printf "    help               display this help message\n"
	@printf "    clean              delete temporary files\n"
	@printf "    purge              delete temporary files and produced pdf\n"

$(TEX_SOURCE).a6paper.pdf:
	$(PROGRAM) $(BUILDPARAM) $(TEX_SOURCE).a6paper.tex