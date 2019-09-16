library(lpSolveAPI)
lp_object<-make.lp(0,9)
set.objfn(lp_object, c(420, 420, 420, 360, 360, 360, 300, 300, 300)) #is there an easier way to write this?
lp.control(lp_object, sense = 'max') #this line returns an output. What does the output mean?

#now add in constraints. this seems really cumbersome...is there an easier way to do this?
#Production constraints:
add.constraint(lp_object, c(1, 0, 0, 1, 0, 0, 1, 0, 0), "<=", 750)
add.constraint(lp_object, c(0, 1, 0, 0, 1, 0, 0, 1, 0), "<=", 900)
add.constraint(lp_object, c(0, 0, 1, 0, 0, 1, 0, 0, 1), "<=", 450)
#in-process storage constraints:
add.constraint(lp_object, c(20, 0, 0, 15, 0, 0, 12, 0, 0), "<=", 13000)
add.constraint(lp_object, c(0, 20, 0, 0, 15, 0, 0, 12, 0), "<=", 12000)
add.constraint(lp_object, c(0, 0, 20, 0, 0, 15, 0, 0, 12), "<=", 5000)
#Sales constraints:
add.constraint(lp_object, c(1, 1, 1, 0, 0, 0, 0, 0, 0), "<=", 900)
add.constraint(lp_object, c(0, 0, 0, 1, 1, 1, 0, 0, 0), "<=", 1200)
add.constraint(lp_object, c(0, 0, 0, 0, 0, 0, 1, 1, 1), "<=", 750)

#excess production percentage constraints
add.constraint(lp_object, c(900, -750, 0, 900, -750, 0, 900, -750, 0), "=", 0)
add.constraint(lp_object, c(0, 450, 900, 0, 450, 900, 0, 450, 900), "=", 0)

#save the model.
write.lp(lp_object, filename = "Weigelt Production", type = "lp")
lp_object

#Now solve the lp problem.
solve(lp_object)
get.objective(lp_object)
get.variables(lp_object)
