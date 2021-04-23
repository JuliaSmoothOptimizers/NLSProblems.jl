# HS problem 79 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs79

"Hock-Schittkowski problem 79 in NLS format"
function hs79(args...)
  model = Model()
  @variable(model, x[1:5], start = 2.0)
  @NLexpression(model, F1, x[1] - 1)
  @NLexpression(model, F2, x[1] - x[2])
  @NLexpression(model, F3, x[2] - x[3])
  @NLexpression(model, F4, (x[3] - x[4])^2)
  @NLexpression(model, F5, (x[4] - x[5])^2)
  @NLconstraint(model, x[1] + x[2]^2 + x[3]^3 == 2 + 3 * sqrt(2))
  @NLconstraint(model, x[2] - x[3]^2 + x[4] == -2 + 2 * sqrt(2))
  @NLconstraint(model, x[1] * x[5] == 2)

  return MathOptNLSModel(model, [F1; F2; F3; F4; F5], name = "hs79")
end
