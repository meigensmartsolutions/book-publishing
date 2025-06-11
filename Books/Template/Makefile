# Makefile: Convert Markdown to 
# - ePub
# - LaTeX using pandoc and compile full book using KDP LaTeX template

echo "Building book:"

#------------------------------------------------------------------------------------------
# General Metadata for all books
#------------------------------------------------------------------------------------------
# Directories
#
# Source directory containing the Markdown files
SRC_DIR ?= manuscript
# Directory for output files
BUILD_DIR ?= exports
# Directory for stylesheets
STYLE_DIR ?= styles
# Directory for scripts
SCRIPT_DIR ?= scripts
# Common LaTeX files for all templates
TEMPLATE_DIR ?= templates
# Common LaTeX files for all books
COMMON_TEX_DIR = ../latex-common
# Directory for LaTeX templates
LATEX_DIR = latex
# Directory for chapter files in LATEX_DIR
CHAPTER_DIR = latex/chapters
#------------------------------------------------------------------------------------------
# Files
CSS ?= $(STYLE_DIR)/quiz-style.css
# Lua filter and options
FILTER ?= $(SCRIPT_DIR)/quiz-divs.lua
# LaTeX files
MAIN_LATEX = $(LATEX_DIR)/main.tex
CHAPTERS = chapters
CHAPTERS_LATEX = $(CHAPTER_DIR)/$(CHAPTERS).tex
# LaTeX pandoc chapter template
CHAPTER_TEMPLATE = $(TEMPLATE_DIR)/pandoc-chapter-template.tex
#------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------
# Book Metadata
BOOK_TITLE ?= "Quiz example book"
BOOK_FILENAME ?= quiz
MD ?= $(SRC_DIR)/$(BOOK_FILENAME).md
EPUB ?= $(BUILD_DIR)/$(BOOK_FILENAME).epub
PDF_OUT ?= $(BUILD_DIR)/$(BOOK_TITLE).pdf
#------------------------------------------------------------------------------------------

# Pandoc Markdown to LaTeX conversion
front: $(SRC_DIR)/frontmatter.md
	pandoc $< \
		--lua-filter=$(FILTER) \
		--template=$(CHAPTER_TEMPLATE) \
		--from markdown \
		--to latex \
		-o $(CHAPTER_DIR)/frontmatter.tex

main: $(SRC_DIR)/maintext.md
	pandoc $< \
		--lua-filter=$(FILTER) \
		--template=$(CHAPTER_TEMPLATE) \
		--from markdown \
		--to latex \
		-o $(CHAPTER_DIR)/maintext.tex

back: $(SRC_DIR)/backmatter.md
	pandoc $< \
		--lua-filter=$(FILTER) \
		--template=$(CHAPTER_TEMPLATE) \
		--from markdown \
		--to latex \
		-o $(CHAPTER_DIR)/backmatter.tex

# Compile LaTeX to PDF (default with xelatex)
pdf: $(CHAPTERS_LATEX)
	latexmk -xelatex -interaction=nonstopmode -f $(MAIN_LATEX) -output-directory=$(BUILD_DIR)



# Compile LaTeX for print-ready output (enables PRINTMODE)
print: $(CHAPTERS_LATEX)
	latexmk -xelatex -interaction=nonstopmode -f $(MAIN_LATEX) -output-directory=$(BUILD_DIR) "\\def\\PRINTMODE{}\\input{$(MAIN_LATEX)}"


# Create EPUB
epub:
	pandoc $(MD) \
		--metadata title=$(BOOK_TITLE) \
		--lua-filter=$(FILTER) \
		--css=$(CSS) \
		--standalone \
		--embed-resources \
		-o $(EPUB)

# Clean build files
clean:
	rm -f $(BUILD_DIR)/*.epub $(BUILD_DIR)/*.pdf
	rm -f $(CHAPTER_DIR)/*.aux $(CHAPTER_DIR)/*.log $(CHAPTER_DIR)/*.toc

# Default target
default: epub
# all: pdf epub

# Phony targets
.PHONY: pdf print clean default


