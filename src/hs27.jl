# HS problem 27 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs27

"Hock-Schittkowski problem 27 in NLS format"
function hs27(args...)
  model = Model()
  @variable(model, x[1:3], start = 2.0)
  @NLexpression(model, F1, 0.1 * (x[1] - 1))
  @NLexpression(model, F2, x[2] - x[1]^2)
  @NLconstraint(model, x[1] + x[3]^2 == -1)

  return MathOptNLSModel(model, [F1; F2], name = "hs27")
end
