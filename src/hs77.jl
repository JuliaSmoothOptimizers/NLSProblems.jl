# HS problem 77 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs77

"Hock-Schittkowski problem 77 in NLS format"
function hs77(args...)

  model = Model()
  @variable(model, x[1:5], start=2.0)
  @NLexpression(model, F1, x[1] - 1)
  @NLexpression(model, F2, x[1] - x[2])
  @NLexpression(model, F3, x[3] - 1)
  @NLexpression(model, F4, (x[4] - 1)^2)
  @NLexpression(model, F5, (x[5] - 1)^3)
  @NLconstraint(model, x[1]^2 * x[4] + sin(x[4] - x[5]) == 2 * sqrt(2))
  @NLconstraint(model, x[2] + x[3]^4 * x[4]^2 == 8 + sqrt(2))

  return MathOptNLSModel(model, [F1; F2; F3; F4; F5], name="hs77")
end
