PAGEN = pagen
NEOCITIES = neocities
OUT = site
ASSETS = assets

TITLE ?= untitled
SLUG := $(shell printf '%s' '$(TITLE)' | tr 'A-Z ' 'a-z-' | tr -cd 'a-z0-9-')
POST = blog/$(shell date +%Y-%m-%d)-$(SLUG).md
EXTRA = extra/$(SLUG).md

POSTTEMPLATE = "template.md.ignore"
FOOTTEMPLATE = "footer.md.ignore"

PFLAGS = -v -s "style.css" -S $(FOOTTEMPLATE) -t "freebuttpics"

.PHONY: all clean deploy post extra

all: clean
	mkdir -p $(OUT)
	cp -r $(ASSETS) $(OUT)/
	@echo "copied assets to $(OUT)"
	$(PAGEN) -r . $(PFLAGS) -o $(OUT)
	@echo "compiled pages to $(OUT)"

clean:
	rm -rf ./$(OUT)

deploy: all
	$(NEOCITIES) push $(OUT)

post:
	@test ! -e $(POST) || { echo "$(POST) already exists"; exit 1; }
	cp $(POSTTEMPLATE) $(POST)
	@echo "created $(POST)"

extra:
	@test ! -e $(EXTRA) || { echo "$(EXTRA) already exists"; exit 1; }
	cp $(POSTTEMPLATE) $(EXTRA)
	@echo "created $(EXTRA)"
