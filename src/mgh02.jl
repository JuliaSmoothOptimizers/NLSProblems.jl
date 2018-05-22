# MGH problem 2 - Freudstein and Roth function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh02

"Freudstein and Roth function"
function mgh02()

  model = Model()
  @variable(model, x[1:2])
  setvalue(x, [0.5; -2.0])
  @NLexpression(model, F1, -13 + x[1] + ((5-x[2])*x[2] - 2) * x[2])
  @NLexpression(model, F2, -29 + x[1] + ((x[2]+1)*x[2] - 14) * x[2])

  return MathProgNLSModel(model, [F1; F2], name="mgh02")
end
