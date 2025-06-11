function Header(el)
  if el.level == 3 and string.match(el.identifier, "^question%-%d+") then
    return pandoc.Div({el}, {class = "quiz-question", id = el.identifier})
  elseif el.level == 3 and string.match(el.identifier, "^answer%-%d+") then
    return pandoc.Div({el}, {class = "quiz-answer", id = el.identifier})
  else
    return el
  end
end