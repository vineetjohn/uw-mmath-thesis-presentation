filename=uw-mmath-thesis-presentation
build-dir=build

all:
	mkdir -p $(build-dir)
	xelatex -halt-on-error -output-directory=$(build-dir) $(filename)
	bibtex $(build-dir)/$(filename)
	xelatex -halt-on-error -output-directory=$(build-dir) $(filename)
	xelatex -halt-on-error -output-directory=$(build-dir) $(filename)

pdf:
	xelatex -halt-on-error -output-directory=$(build-dir) $(filename)

bib:
	bibtex $(build-dir)/$(filename)

read: pdf
	xdg-open $(build-dir)/$(filename).pdf &> /dev/null 

clean:
	rm -rf ${build-dir}
