# MGH problem 13 - Powell singular function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh13

"Powell singular function"
function mgh13(args...)

  model = Model()
  @variable(model, x[1:4])
  set_start_value.(x, [3.0; -1.0; 0.0; 1.0])
  @NLexpression(model, F1, x[1] + 10x[2])
  @NLexpression(model, F2, sqrt(5)*(x[3] - x[4]))
  @NLexpression(model, F3, (x[2] - 2x[3])^2)
  @NLexpression(model, F4, sqrt(2)*(x[1] - x[4])^2)

  return MathOptNLSModel(model, [F1; F2; F3; F4], name="mgh13")
end
