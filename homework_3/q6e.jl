using JuMP, GLPK

model_A = Model(GLPK.Optimizer)

@variable(model_A, y[1:4] >= 0)
@variable(model_A, v)

@constraint(model_A, -2 * y[2] + 3 * y[3] >= v)
@constraint(model_A, 2 * y[1] - 3 * y[4] >= v)
@constraint(model_A, -3 * y[1] + 4 * y[4] >= v)
@constraint(model_A, 3 * y[2] - 4 * y[3] >= v)
@constraint(model_A, sum(y) == 1)

@objective(model_A, Max, v)

optimize!(model_A)
opt_strategy_A = value.(y)
opt_value_A = objective_value(model_A)

println("Optimal strategy for Player A: ", opt_strategy_A)
println("Value of the game for Player A: ", opt_value_A)