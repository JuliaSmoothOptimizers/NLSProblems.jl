# HS problem 14 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs14

"Hock-Schittkowski problem 14 in NLS format"
function hs14(args...)

  model = Model()
  @variable(model, x[1:2], start=2.0)
  @NLexpression(model, F1, x[1] - 2)
  @NLexpression(model, F2, x[2] - 1)
  @NLconstraint(model, -0.25 * x[1]^2 - x[2]^2 + 1.0 ≥ 0.0)
  @constraint(model, x[1] - 2 * x[2] == -1.0)

  return MathOptNLSModel(model, [F1; F2], name="hs14")
end
