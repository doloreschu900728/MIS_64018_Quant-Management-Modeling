library(lpSolveAPI)

#IP formulation for question #1
z<-read.lp("zchu_5c.lp")
solve(z)
get.objective(z)
get.variables(z)

#IP formulation for question #2 part 1)
x<-read.lp("zchu_5a.lp")
solve(x)
get.objective(x)
get.variables(x)
x

#IP formulation for question #2 part 2)
y<-read.lp("zchu_5b.lp")
solve(y)
get.objective(y)
get.variables(y)


