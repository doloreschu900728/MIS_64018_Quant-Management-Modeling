library(lpSolveAPI)
x<-read.lp("zchu_5a.lp")
solve(x)
get.objective(x)
get.variables(x)
x

y<-read.lp("zchu_5b.lp")
solve(y)
get.objective(y)
get.variables(y)
