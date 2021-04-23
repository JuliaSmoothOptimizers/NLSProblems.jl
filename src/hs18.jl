# HS problem 18 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs18

"Hock-Schittkowski problem 18 in NLS format"
function hs18(args...)
  model = Model()
  lvar = [2.0; 0.0]
  uvar = [50.0; 50.0]
  @variable(model, lvar[i] ≤ x[i = 1:2] ≤ uvar[i], start = 2.0)
  @NLexpression(model, F1, 0.1 * x[1])
  @NLexpression(model, F2, x[2] + 0.0)
  @NLconstraint(model, x[1] * x[2] ≥ 25)
  @NLconstraint(model, x[1]^2 + x[2]^2 ≥ 25)

  return MathOptNLSModel(model, [F1; F2], name = "hs18")
end
