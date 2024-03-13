using JuMP, Ipopt

model = Model(Ipopt.Optimizer)

@variable(model, x[1:4] >= 0)

@constraint(model, -x[1] - x[2] == -1)
@constraint(model, x[1] - x[3] == 0)
@constraint(model, x[2] - x[4] == 0)
@constraint(model, x[3] + x[4] == 1)

@objective(model, Min, sum(x))

optimize!(model)

println(value.(x))
