pandoc quiz.md \
  --lua-filter=quiz-divs.lua \
  --pdf-engine=xelatex \
  --template=your-template.tex \
  -o quiz.pdf

# pandoc quiz.md \
#  --lua-filter=quiz-divs.lua \
# --css=quiz-style.css \
# -o quiz.epub