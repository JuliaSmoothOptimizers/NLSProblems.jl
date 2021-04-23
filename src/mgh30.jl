# MGH problem 30 - Broyden tridiagonal function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh30

"Broyden tridiagonal function"
function mgh30(n::Int = 10)
  model = Model()
  @variable(model, x[1:n], start = -1)
  @NLexpression(model, F1, (3 - 2x[1]) * x[1] - 2x[2] + 1)
  @NLexpression(model, F2[i = 1:(n - 2)], (3 - 2x[i + 1]) * x[i + 1] - x[i] - 2x[i + 2] + 1)
  @NLexpression(model, F3, (3 - 2x[n]) * x[n] - x[n - 1] + 1)

  return MathOptNLSModel(model, [F1; F2; F3], name = "mgh30")
end
