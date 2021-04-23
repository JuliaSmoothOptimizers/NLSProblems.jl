# MGH problem 28 - Discrete boundary value function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh28

"Discrete boundary value function"
function mgh28(n::Int = 10)
  h = 1 / (n + 1)
  t = (1:n) * h
  model = Model()
  @variable(model, x[i = 1:n], start = t[i] * (t[i] - 1))
  @NLexpression(model, F1, 2x[1] - x[2] + h^2 * (x[1] + h + 1)^3 / 2)
  @NLexpression(
    model,
    F2[i = 1:(n - 2)],
    2x[i + 1] - x[i] - x[i + 2] + h^2 * (x[i + 1] + (i + 1) * h + 1)^3 / 2
  )
  @NLexpression(model, F3, 2x[n] - x[n - 1] + h^2 * (x[n] + n * h + 1)^3 / 2)

  return MathOptNLSModel(model, [F1; F2; F3], name = "mgh28")
end
