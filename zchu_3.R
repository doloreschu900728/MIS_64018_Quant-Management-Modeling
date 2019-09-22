library(lpSolveAPI)
lp_object<-make.lp(0,9)
set.objfn(lp_object, c(420, 420, 420, 360, 360, 360, 300, 300, 300)) #is there an easier way to write this?
set.objfn(lp_object, rep(c(420,360,300), each=3)) #use the rep() function can simplify. But maybe this isn't the best because it is more visually straighforward when all coefficients are written out.
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
add.constraint(lp_object, c(0, 450, -900, 0, 450, -900, 0, 450, -900), "=", 0)

#set variables and constraint names
RowNames<-c("L1", "L2", "L2", "M1", "M2", "M3", "L1", "L2", "L3")
ColNames<-c("Production Constraint_1", "Production Constraint_2", "Production Constraint_3", "Storage Constraint_1", "Storage Constraint_2", "Storage Constraint_3", "Sales Constraint_L", "Sales Constraint_M", "Sales Constraint_S", "Percentage 1", "Percentage2")

#save the model.
write.lp(lp_object, filename = "Weigelt Production", type = "lp")
lp_object

#print model.
lp_object

#Now solve the lp problem.
solve(lp_object)
get.objective(lp_object)
get.variables(lp_object)

#find shadow prices. How can there be negatives???
get.sensitivity.rhs(lp_object)

#find reduced costs
get.sensitivity.obj(lp_object)

#Formulate the dual problem
lp_dual<-make.lp(0,11)
set.objfn(lp_dual, c(750, 900, 450, 13000, 12000, 5000, 900, 1200, 750, 0, 0))
lp.control(lp_dual, sense = "min")

add.constraint(lp_dual, c(1, 0, 0, 20, 0, 0, 1, 0, 0, 900, 0), ">=", 420)
add.constraint(lp_dual, c(0, 1, 0, 0, 20, 0, 1, 0, 0, -700, 450), ">=", 420)
add.constraint(lp_dual, c(0, 0, 1, 0, 0, 20, 1, 0, 0, 0, -900), ">=", 420)

add.constraint(lp_dual, c(1, 0, 0, 15, 0, 0, 0, 1, 0, 900, 0), ">=", 360)
add.constraint(lp_dual, c(0, 1, 0, 0, 15, 0, 0, 1, 0, -700, 450), ">=", 360)
add.constraint(lp_dual, c(0, 0, 1, 0, 0, 15, 0, 1, 0, 0, -900), ">=", 360)

add.constraint(lp_dual, c(1, 0, 0, 12, 0, 0, 0, 0, 1, 900, 0), ">=", 300)
add.constraint(lp_dual, c(0, 1, 0, 0, 12, 0, 0, 0, 1, -700, 450), ">=", 300)
add.constraint(lp_dual, c(0, 0, 1, 0, 0, 12, 0, 0, 1, 0, -900), ">=", 300)

#save the model
write.lp(lp_dual, filename = "Weigelt Production_Dual", type = "lp")

#solve the model
solve(lp_dual)
get.objective(lp_dual)
get.variables(lp_dual)
get.sensitivity.rhs(lp_dual)


