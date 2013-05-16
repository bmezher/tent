
## resize to terminal
#local({
#  cols <- Sys.getenv("COLUMNS")
#  print(cols)
#  if(nzchar(cols)) options(width = as.integer(cols))
#})

.adjustwidth <- function(...){
  cols <- Sys.getenv("COLUMNS")
  if(nzchar(cols)) {
    options(width=as.integer(cols))
  } else {
    options(width=as.integer(system('tput cols',intern=TRUE)))
  }
  TRUE
}
 
if (nzchar(Sys.getenv("TERM"))) {
  .adjustWidthCallBack <- addTaskCallback(.adjustwidth)
}
