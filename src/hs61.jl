# HS problem 61 in NLS format without constants in the objective
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs61

"Hock-Schittkowski problem 61 in NLS format without constants in the objective"
function hs61(args...)
  model = Model()
  @variable(model, x[1:3], start = 0.0)
  @NLexpression(model, F1, 2 * (x[1] - 33 / 8))
  @NLexpression(model, F2, sqrt(2) * (x[2] + 4))
  @NLexpression(model, F3, sqrt(2) * (x[3] - 6))
  @NLconstraint(model, 3 * x[1] - 2 * x[2]^2 == 7)
  @NLconstraint(model, 4 * x[1] - 3 * x[3]^2 == 11)

  return MathOptNLSModel(model, [F1; F2; F3], name = "hs61")
end
