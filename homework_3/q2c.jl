using LinearAlgebra
using JuMP, GLPK

# Solving with f_1 as the cost function
model = Model(GLPK.Optimizer)

@variable(model, a)
@variable(model, b)
@variable(model, e[1:7] >= 0)

x = [1, 2, 2.5, 3, 3, 4, 5]
# Changing g_5 from 5.5 to 100
g = [2, 1, 3, 3, 100, 3.5, 5]

for k in 1:7
    @constraint(model, a + b * x[k] - g[k] <= e[k])
    @constraint(model, -a - b * x[k] + g[k] <= e[k])
end

@objective(model, Min, sum(e))

optimize!(model)
a1 = value(a)
b1 = value(b)
println("a1 + b1 * x = $a1 + $b1 * x")

# Solving with f_2 as the cost function
A = [ones(length(x)) x]

y = (A' * A) \ (A' * g)

a2, b2 = y
println("a2 + b2 * x = $a2 + $b2 * x")
