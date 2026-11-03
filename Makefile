PAGEN = pagen
OUT = ../pages
ASSETS = assets

DATE := $(shell date +"%d%m%Y")
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
	@test ! -e $(POSTDIR) || {
		echo "$(POSTDIR) already exists" >&2; exit 1;
	}
	mkdir -p $(POSTDIR);
	cp $(POSTTEMPLATE) $(POSTDIR)/index.md
	@echo "created $(POSTDIR)/index.md"
