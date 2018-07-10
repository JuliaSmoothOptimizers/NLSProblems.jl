# MGH problem 1 - Rosenbrock function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh01, nls_rosenbrock

"Rosenbrock problem in Nonlinear Least Squares form"
function mgh01(args...)

  model = Model()
  @variable(model, x[1:2])
  setvalue(x, [-1.2; 1.0])
  @NLexpression(model, F1, 10*(x[2] - x[1]^2))
  @NLexpression(model, F2, 1 - x[1])

  return MathProgNLSModel(model, [F1; F2], name="mgh01")
end

@doc (@doc mgh01)
nls_rosenbrock(args...) = mgh01()
