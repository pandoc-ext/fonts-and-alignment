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
CSS_EM  := ../fonts-and-alignment-em.css
CSS_REM := $(EXT_DIR)/fonts-and-alignment.css
DIST_CSS_FILES := $(CSS_EM) $(CSS_REM)

# Private Development SASS Source Files
SASS_SRC_DIR := src
SASS_CORE    := $(SASS_SRC_DIR)/_fonts-and-alignment-core.sass
SASS_EM_SRC  := $(SASS_SRC_DIR)/fonts-and-alignment-em.sass
SASS_REM_SRC := $(SASS_SRC_DIR)/fonts-and-alignment.sass

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

# Default behavior when running `make` with no target
.DEFAULT_GOAL := help

# ==============================================================================
# Dynamic Test Detection
# ==============================================================================
# 1. Find all specific test YAMLs (ignoring the base test.yaml)
TEST_YAMLS := $(filter-out test/test.yaml, $(wildcard test/test-*.yaml))
# 2. Extract just the name parts (e.g., "span-font-sizes")
TEST_NAMES := $(patsubst test/test-%.yaml,%,$(TEST_YAMLS))
# 2b. `input` is the filter's full usage manual — rendered for the docs site and
#     previews, not a test fixture — so it is excluded from the AST-diff set.
#     The focused span-*/div-* tests provide the correctness coverage.
DIFF_NAMES := $(filter-out input,$(TEST_NAMES))
# 3. Grab all markdown files in the test directory to use as dependencies
TEST_INPUTS := $(wildcard test/*.md)


# ==============================================================================
# Help Menu (Self-Documenting Target)
# ==============================================================================
.PHONY: help
help: ## Show this help menu
	@echo "Pandoc Fonts & Alignment Extension Build System"
	@echo "==============================================="
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)


# ==============================================================================
# Master Pipeline
# ==============================================================================
.PHONY: all
all: clean filter-proxy css docs previews test ## Run the complete clean, build, test, and docs pipeline


# ==============================================================================
# Environment Setup (Cross-Platform Root-level Filter Proxy)
# ==============================================================================
$(FILTER_FILE): $(FILTER_DIST)
	@echo "--- Auto-generated proxy for cross-platform compatibility" > $@
	@echo "return dofile('$(FILTER_DIST)')" >> $@

.PHONY: filter-proxy
filter-proxy: $(FILTER_FILE) ## Generate the cross-platform root-level filter proxy


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
css: $(DIST_CSS_FILES) ## Compile SASS sources into distribution CSS files


# ==============================================================================
# Testing Rules (AST Generation & Diffing)
# ==============================================================================
.PHONY: test
test: $(FILTER_FILE) $(addprefix test-,$(DIFF_NAMES)) ## Run the focused AST diff tests

test-%: $(FILTER_FILE) test/test.yaml test/test-%.yaml $(TEST_INPUTS)
	$(PANDOC) --defaults test/test.yaml --defaults test/test-$*.yaml | \
		$(DIFF) test/expected-$*.native -

.PHONY: update-expected
update-expected: $(FILTER_FILE) $(addprefix update-,$(DIFF_NAMES)) ## Overwrite expected AST test outputs

update-%: $(FILTER_FILE) test/test.yaml test/test-%.yaml $(TEST_INPUTS)
	$(PANDOC) \
		--defaults=test/test.yaml \
		--defaults=test/test-$*.yaml \
		--output=test/expected-$*.native


# ==============================================================================
# Visual Previews Generation (Decoupled from phony job name)
# ==============================================================================
PREVIEWS_DIR := artifacts

PREVIEW_HTMLS := $(addprefix $(PREVIEWS_DIR)/, $(addsuffix .html, $(TEST_NAMES)))
PREVIEW_PDFS  := $(addprefix $(PREVIEWS_DIR)/, $(addsuffix .pdf, $(TEST_NAMES)))

SYNTAX_HIGHLIGHTING := tango

.PHONY: previews
previews: $(FILTER_FILE) $(DIST_CSS_FILES) $(PREVIEW_HTMLS) $(PREVIEW_PDFS) ## Build visual HTML/PDF layout previews

$(PREVIEWS_DIR)/%.html: test/test.yaml test/test-%.yaml test/preview-framing.lua $(TEST_INPUTS) $(FILTER_FILE) $(DIST_CSS_FILES) | $(PREVIEWS_DIR)
	$(PANDOC) \
		--lua-filter=test/preview-framing.lua \
		--defaults=test/test.yaml \
		--defaults=test/test-$*.yaml \
		--to=html \
		--syntax-highlighting=$(SYNTAX_HIGHLIGHTING) \
		--number-sections \
		--shift-heading-level-by=-1 \
		--css=../$(CSS_REM) \
		--css=../test/preview-suite.css \
		--output=$@

$(PREVIEWS_DIR)/%.pdf: test/test.yaml test/test-%.yaml test/preview-framing.lua $(TEST_INPUTS) $(FILTER_FILE) | $(PREVIEWS_DIR)
	$(PANDOC) \
		--lua-filter=test/preview-framing.lua \
		--defaults=test/test.yaml \
		--defaults=test/test-$*.yaml \
		--to=pdf \
		--syntax-highlighting=$(SYNTAX_HIGHLIGHTING) \
		--number-sections \
		--shift-heading-level-by=-1 \
		--output=$@

$(PREVIEWS_DIR):
	mkdir -p $(PREVIEWS_DIR)


# ==============================================================================
# Documentation
# ==============================================================================
.PHONY: docs
docs: docs/index.html docs/input.html docs/input.pdf docs/fonts-and-alignment.lua ## Build the standalone documentation site

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

docs/input.html: test/input.md $(FILTER_FILE) $(DIST_CSS_FILES) test/preview-suite.css
	$(PANDOC) \
		--standalone \
		--lua-filter=$(FILTER_FILE) \
		--to=html \
		--syntax-highlighting=$(SYNTAX_HIGHLIGHTING) \
		--css=../$(CSS_REM) \
		--css=../test/preview-suite.css \
		--output=$@ $<

docs/input.pdf: test/input.md $(FILTER_FILE) test/preview-framing.lua
	$(PANDOC) \
		--lua-filter=test/preview-framing.lua \
		--lua-filter=$(FILTER_FILE) \
		--to=pdf \
		--syntax-highlighting=$(SYNTAX_HIGHLIGHTING) \
		--output=$@ $<

docs/fonts-and-alignment.lua: $(FILTER_FILE)
	@mkdir -p docs
	cp $(FILTER_FILE) $@


# ==============================================================================
# Housekeeping
# ==============================================================================
.PHONY: clean
clean: ## Remove all built artifacts, CSS distributions, and temporary files
	rm -f docs/output.md docs/index.html docs/input.html docs/input.pdf docs/style.css docs/fonts-and-alignment.lua
	rm -rf $(PREVIEWS_DIR)
	rm -f $(DIST_CSS_FILES)
	rm -f $(FILTER_FILE)
