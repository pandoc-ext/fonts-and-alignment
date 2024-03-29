# Name of the filter file, *with* `.lua` file extension.
FILTER_FILE := $(wildcard *.lua)
# Name of the filter, *without* `.lua` file extension
FILTER_NAME = $(patsubst %.lua,%,$(FILTER_FILE))

# Allow to use a different pandoc binary, e.g. when testing.
PANDOC ?= pandoc
# Allow to adjust the diff command if necessary
DIFF = diff

SPECIMEN_SASS = specimen.sass
SPECIMEN_CSS = specimen.css
SPECIMEN_HTML = specimen.html
SPECIMEN_PDF = specimen.pdf

.PHONY: all
all: clean docs specimens test/expected.native

# Test that running the filter on the sample input document yields
# the expected output.
#
# The automatic variable `$<` refers to the first dependency
# (i.e., the filter file).
test: $(FILTER_FILE) test/input.md
	$(PANDOC) --lua-filter=$< --to=native test/input.md \
		--metadata=ulem_styles | \
		$(DIFF) test/expected.native -

# Ensure that the `test` target is run each time it's called.
.PHONY: test

# Re-generate the expected output. This file **must not** be a
# dependency of the `test` target, as that would cause it to be
# regenerated on each run, making the test pointless.
test/expected.native: $(FILTER_FILE) test/input.md
	$(PANDOC) --lua-filter=$< --to=native --output=$@ \
		--metadata=ulem_styles \
		test/input.md

#
# Generate specimen documents
#
.PHONY: specimens
specimens: specimens/${SPECIMEN_CSS} specimens/${SPECIMEN_HTML} specimens/${SPECIMEN_PDF}

specimens/specimen.css: specimens/${SPECIMEN_SASS}
	sass --no-source-map specimens/${SPECIMEN_SASS} specimens/${SPECIMEN_CSS}

specimens/specimen.html: $(FILTER_FILE) test/input.md
	$(PANDOC) --lua-filter=$< --to=html5 --standalone \
		--metadata=ulem_styles \
		--css=${SPECIMEN_CSS} --output=$@ test/input.md

specimens/specimen.pdf: $(FILTER_FILE) test/input.md
	$(PANDOC) --lua-filter=$< --to=latex --standalone --pdf-engine=lualatex \
		--metadata=ulem_styles \
		--output=$@ test/input.md

#
# Docs
#
.PHONY: docs
docs: docs/index.html docs/$(FILTER_FILE)

docs/index.html: README.md test/input.md $(FILTER_FILE) .tools/docs.lua \
		docs/output.md docs/style.css
	@mkdir -p docs
	pandoc \
	    --standalone \
	    --lua-filter=.tools/docs.lua \
	    --metadata=sample-file:test/input.md \
	    --metadata=result-file:docs/output.md \
	    --metadata=code-file:$(FILTER_FILE) \
	    --css=style.css \
	    --toc \
	    --output=$@ $<

docs/style.css:
	curl \
	    --output $@ \
	    'https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.css'

docs/output.md: $(FILTER_FILE) test/input.md
	$(PANDOC) \
	    --output=$@ \
	    --lua-filter=$< \
	    --to=markdown \
	    --standalone \
	    test/input.md

docs/$(FILTER_FILE): $(FILTER_FILE)
	(cd docs && ln -sf ../$< $<)

.PHONY: clean
clean:
	rm -f docs/output.md docs/index.html docs/style.css specimens/${SPECIMEN_CSS} specimens/${SPECIMEN_HTML} specimens/${SPECIMEN_PDF}
