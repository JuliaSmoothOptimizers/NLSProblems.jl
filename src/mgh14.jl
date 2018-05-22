# MGH problem 14 - Wood function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh14

"Wood function"
function mgh14()

  model = Model()
  @variable(model, x[1:4])
  setvalue(x, [-3.0; -1.0; -3.0; -1.0])
  @NLexpression(model, F1, 10 * (x[2] - x[1]^2))
  @NLexpression(model, F2, 1 - x[1])
  @NLexpression(model, F3, sqrt(90) * (x[4] - x[3]^2))
  @NLexpression(model, F4, 1 - x[3])
  @NLexpression(model, F5, sqrt(10) * (x[2] + x[4] - 2))
  @NLexpression(model, F6, (x[2] - x[4]) / sqrt(10))

  return MathProgNLSModel(model, [F1; F2; F3; F4; F5; F6], name="mgh14")
end
