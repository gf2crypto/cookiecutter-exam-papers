@ECHO OFF

set TEX_SOURCE="{{cookiecutter.project_name}}"

set PROGRAM=latexmk
set VIEWPDFPARAM=-pv
set BUILDPARAM=-cd -f -pdf -interaction=nonstopmode -synctex=1 -latexoption=-shell-escape
set WATCHPARAM=-pvc -f -pdf -interaction=nonstopmode -synctex=1 -latexoption=-shell-escape

set TEMP_FILES=("*.aux", "*.fdb_latexmk", "*.fls", "*.log", "*.out", "*.synctex.gz", "*.xdv")

set ACTION=%1

IF "%ACTION%"=="help" goto help
IF "%ACTION%"=="build" goto build
IF "%ACTION%"=="watch" goto watch
IF "%ACTION%"=="" goto build
IF "%ACTION%"=="clean" goto clean
IF "%ACTION%"=="purge" goto purge

goto exit

:help
echo Usage: make [options] [target] ...
echo Valid targets:
echo.
echo     `build` - compile the tex-source (default action)
echo     `watch` - compile the tex-source continously
echo     `help`  - display this help message
echo     `clean` - delete temporary files
echo     `purge` - delete temporary files and produced pdf file
echo.

goto exit

:build
%PROGRAM% %BUILDPARAM% %TEX_SOURCE%.a6paper.tex
%PROGRAM% %VIEWPDFPARAM% %BUILDPARAM% %TEX_SOURCE%.tex

goto exit

:watch
%PROGRAM% %BUILDPARAM% %TEX_SOURCE%.a6paper.tex
%PROGRAM% %WATCHPARAM% %TEX_SOURCE%.tex

goto exit

:clean
for %%F in %TEMP_FILES% do del /F %%F

goto exit

:purge
for %%F in %TEMP_FILES% do del /F %%F
del /F %TEX_SOURCE%.pdf
del /F %TEX_SOURCE%.a6paper.pdf

goto exit

:exit
PAUSE
