function CopyHTMLClassesCSS()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)

  local classes = {}

  for _, line in ipairs(lines) do
    for cls in line:gmatch('class="([^"]+)"') do
      for c in cls:gmatch("%S+") do
        classes[c] = true
      end
    end
  end

  local class_list = {}
  for c, _ in pairs(classes) do
    table.insert(class_list, "." .. c .. "{}")
  end
  table.sort(class_list)

  vim.fn.setreg('+', table.concat(class_list, " "))
  print("Copied CSS selectors: " .. table.concat(class_list, " "))
end


