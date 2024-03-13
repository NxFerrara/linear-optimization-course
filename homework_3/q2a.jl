using JuMP, GLPK

model = Model(GLPK.Optimizer)

@variable(model, a)
@variable(model, b)
@variable(model, e[1:7] >= 0)

x = [1, 2, 2.5, 3, 3, 4, 5]
g = [2, 1, 3, 3, 5.5, 3.5, 5]

for k in 1:7
    @constraint(model, a + b * x[k] - g[k] <= e[k])
    @constraint(model, -a - b * x[k] + g[k] <= e[k])
end

@objective(model, Min, sum(e))

optimize!(model)
a1 = value(a)
b1 = value(b)
print("a + b * x = $a1 + $b1 * x")
