# MGH problem 4 - Brown badly scaled function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh04

"Brown badly scaled function"
function mgh04(args...)
  model = Model()
  @variable(model, x[1:2], start = 1)
  @expression(model, F1, x[1] - 1e6)
  @expression(model, F2, x[2] - 2e-6)
  @expression(model, F3, x[1] * x[2] - 2.0)

  return MathOptNLSModel(model, [F1; F2; F3], name = "mgh04")
end
