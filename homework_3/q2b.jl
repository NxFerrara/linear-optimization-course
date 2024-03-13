using LinearAlgebra

x = [1, 2, 2.5, 3, 3, 4, 5]
g = [2, 1, 3, 3, 5.5, 3.5, 5]

A = [ones(length(x)) x]

y = (A' * A) \ (A' * g)

a1, b1 = y
print("a + b * x = $a1 + $b1 * x")
