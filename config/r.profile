
# resize to terminal
local({
  cols <- Sys.getenv("COLUMNS")
  print(cols)
  if(nzchar(cols)) options(width = as.integer(cols))
})
