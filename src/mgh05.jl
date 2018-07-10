# MGH problem 5 - Beale function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh05

"Beale function"
function mgh05(args...)

  y = [1.5; 2.25; 2.625]
  model = Model()
  @variable(model, x[1:2], start=1.0)
  @NLexpression(model, F[i=1:3], y[i] - x[1]*(1 - x[2]^i))

  return MathProgNLSModel(model, F, name="mgh05")
end
