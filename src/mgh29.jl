# MGH problem 29 - Discrete integral equation function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh29

"Discrete integral equation function"
function mgh29(n::Int = 10)
  h = 1 / (n + 1)
  t = (1:n) * h
  model = Model()
  @variable(model, x[i = 1:n], start = t[i] * (t[i] - 1))
  @NLexpression(
    model,
    F[i = 1:n],
    x[i] +
    h * (
      (1 - t[i]) * sum(t[j] * (x[j] + t[j] + 1)^3 for j = 1:i) +
      t[i] * sum((1 - t[j]) * (x[j] + t[j] + 1)^3 for j = (i + 1):n)
    ) / 2
  )

  return MathOptNLSModel(model, F, name = "mgh29")
end
