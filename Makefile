DOTDIR := dotfiles
SVGDIR := output/svg
PNGDIR := output/png

DOTFILES := $(wildcard $(DOTDIR)/*.dot)
SVGFILES := $(patsubst $(DOTDIR)/%.dot,$(SVGDIR)/%.svg,$(DOTFILES))
PNGFILES := $(patsubst $(DOTDIR)/%.dot,$(PNGDIR)/%.png,$(DOTFILES))

all: svg png

svg: $(SVGFILES)

png: $(PNGFILES)

$(SVGDIR)/%.svg: $(DOTDIR)/%.dot | $(SVGDIR)
	dot -Tsvg $< -o $@

$(PNGDIR)/%.png: $(DOTDIR)/%.dot | $(PNGDIR)
	dot -Tpng $< -o $@

$(SVGDIR):
	mkdir -p $(SVGDIR)

$(PNGDIR):
	mkdir -p $(PNGDIR)

clean:
	rm -rf output

.PHONY: all svg png clean

