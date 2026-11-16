PAGEN = pagen
OUT = ../pages
ASSETS = assets

DATE := $(shell date +%s)
POSTDIR = blog/$(DATE)

POSTTEMPLATE = "template.ignore"
FOOTTEMPLATE = "footer.ignore"

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
