# ==============================================================================
# Configuration & Variables
# ==============================================================================

# Distribution Extension Folder Path
EXT_DIR := _extensions/fonts-and-alignment

# Location of the core filter engine inside the extension
FILTER_DIST := $(EXT_DIR)/fonts-and-alignment.lua

# Root-level filter shortcut for Pandoc/Quarto execution
FILTER_FILE := fonts-and-alignment.lua

# Generated Core Distribution CSS Files
CSS_EM  := $(EXT_DIR)/fonts-and-alignment-em.css
CSS_REM := $(EXT_DIR)/fonts-and-alignment-rem.css
DIST_CSS_FILES := $(CSS_EM) $(CSS_REM)

# Private Development SASS Source Files
SASS_SRC_DIR := src
SASS_CORE    := $(SASS_SRC_DIR)/_fonts-and-alignment-core.sass
SASS_EM_SRC  := $(SASS_SRC_DIR)/fonts-and-alignment-em.sass
SASS_REM_SRC := $(SASS_SRC_DIR)/fonts-and-alignment-rem.sass

# Allow to use a different pandoc binary, e.g. when testing.
PANDOC ?= pandoc
# Allow to adjust the diff command if necessary
DIFF = diff

# Current version, i.e., the latest tag. Used to version the quarto extension.
VERSION = $(shell git tag --sort=-version:refname --merged | head -n1 | \
                         sed -e 's/^v//' | tr -d "\n")
ifeq "$(VERSION)" ""
VERSION = 0.0.0
endif

# ==============================================================================
# Dynamic Test Detection
# ==============================================================================
# 1. Find all specific test YAMLs (ignoring the base test.yaml)
TEST_YAMLS := $(filter-out test/test.yaml, $(wildcard test/test-*.yaml))
# 2. Extract just the name parts (e.g., "inline-font-sizes")
TEST_NAMES := $(patsubst test/test-%.yaml,%,$(TEST_YAMLS))
# 3. Grab all markdown files in the test directory to use as dependencies
TEST_INPUTS := $(wildcard test/*.md)

.PHONY: all
all: clean filter-symlink css docs previews test


# ==============================================================================
# Environment Setup (Ensures Root-level Filter Symlink Exists for Pandoc)
# ==============================================================================
$(FILTER_FILE): $(FILTER_DIST)
	ln -sf $(FILTER_DIST) $@

.PHONY: filter-symlink
filter-symlink: $(FILTER_FILE)


# ==============================================================================
# CSS Transformation (Compiles SASS from src/ straight to extension distribution)
# ==============================================================================
$(CSS_EM): $(SASS_EM_SRC) $(SASS_CORE)
	@mkdir -p $(EXT_DIR)
	sass --no-source-map $< $@

$(CSS_REM): $(SASS_REM_SRC) $(SASS_CORE)
	@mkdir -p $(EXT_DIR)
	sass --no-source-map $< $@

.PHONY: css
css: $(DIST_CSS_FILES)


# ==============================================================================
# Testing Rules (AST Generation & Diffing)
# ==============================================================================
.PHONY: test
test: $(FILTER_FILE) $(addprefix test-,$(TEST_NAMES))

test-%: $(FILTER_FILE) test/test.yaml test/test-%.yaml $(TEST_INPUTS)
	$(PANDOC) --defaults test/test.yaml --defaults test/test-$*.yaml | \
		$(DIFF) test/expected-$*.native -

.PHONY: update-expected
update-expected: $(FILTER_FILE) $(addprefix update-,$(TEST_NAMES))

update-%: $(FILTER_FILE) test/test.yaml test/test-%.yaml $(TEST_INPUTS)
	$(PANDOC) \
		--defaults=test/test.yaml \
		--defaults=test/test-$*.yaml \
		--output=test/expected-$*.native


# ==============================================================================
# Visual Previews Generation (Tests layout and typography configurations)
# ==============================================================================
PREVIEW_OUT := previews

PREVIEW_HTMLS := $(addprefix $(PREVIEW_OUT)/, $(addsuffix .html, $(TEST_NAMES)))
PREVIEW_PDFS  := $(addprefix $(PREVIEW_OUT)/, $(addsuffix .pdf, $(TEST_NAMES)))

.PHONY: previews
previews: $(FILTER_FILE) $(DIST_CSS_FILES) $(PREVIEW_HTMLS) $(PREVIEW_PDFS)

$(PREVIEW_OUT)/%.html: test/test.yaml test/test-%.yaml $(TEST_INPUTS) $(FILTER_FILE) $(DIST_CSS_FILES) | $(PREVIEW_OUT)
	$(PANDOC) \
		--defaults=test/test.yaml \
		--defaults=test/test-$*.yaml \
		--to=html \
		--css=../$(CSS_REM) \
		--css=../test/preview-suite.css \
		--output=$@

$(PREVIEW_OUT)/%.pdf: test/test.yaml test/test-%.yaml $(TEST_INPUTS) $(FILTER_FILE) | $(PREVIEW_OUT)
	$(PANDOC) \
		--defaults=test/test.yaml \
		--defaults=test/test-$*.yaml \
		--to=pdf \
		--output=$@

$(PREVIEW_OUT):
	mkdir -p $(PREVIEW_OUT)


# ==============================================================================
# Documentation
# ==============================================================================
.PHONY: docs
docs: docs/index.html docs/fonts-and-alignment.lua

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

docs/fonts-and-alignment.lua: $(FILTER_DIST)
	@mkdir -p docs
	ln -sf ../$(FILTER_DIST) $@


# ==============================================================================
# Housekeeping
# ==============================================================================
.PHONY: clean
clean:
	rm -f docs/output.md docs/index.html docs/style.css docs/fonts-and-alignment.lua
	rm -rf $(PREVIEW_OUT)
	rm -f $(DIST_CSS_FILES)
	rm -f $(FILTER_FILE)
