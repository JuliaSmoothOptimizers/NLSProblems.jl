# HS problem 60 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs60

"Hock-Schittkowski problem 60 in NLS format"
function hs60(args...)
  model = Model()
  @variable(model, -10 ≤ x[1:3] ≤ 10, start = 2.0)
  @expression(model, F1, x[1] - 1)
  @expression(model, F2, x[1] - x[2])
  @NLexpression(model, F3, (x[2] - x[3])^2)
  @NLconstraint(model, x[1] * (1 + x[2]^2) + x[3]^4 == 4 + 3 * sqrt(2))

  return MathOptNLSModel(model, [F1; F2; F3], name = "hs60")
end
