PAGEN = pagen
OUT = ../pages
ASSETS = assets

TITLE ?= untitled
SLUG := $(shell printf '%s' '$(TITLE)' | tr 'A-Z ' 'a-z-' | tr -cd 'a-z0-9-')
POSTDIR = blog/$(shell date +%Y-%m-%d)-$(SLUG)

POSTTEMPLATE = "template.md.ignore"
FOOTTEMPLATE = "footer.md.ignore"

PFLAGS = -v -s "style.css" -S $(FOOTTEMPLATE) -t "freebuttpics.xyz"

.PHONY: all post

all:
	mkdir -p $(OUT)
	cp -r $(ASSETS) $(OUT)/
	@echo "copied assets to $(OUT)"
	$(PAGEN) -r . $(PFLAGS) -o $(OUT)
	@echo "compiled pages to $(OUT)"

post:
	mkdir -p $(POSTDIR);
	cp $(POSTTEMPLATE) $(POSTDIR)/index.md
	@echo "created $(POSTDIR)/index.md"
