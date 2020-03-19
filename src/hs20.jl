# HS problem 20 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs20

"Hock-Schittkowski problem 20 in NLS format"
function hs20(args...)

  model = Model()
  lvar = [-0.5; -Inf]
  uvar = [0.5; Inf]
  @variable(model, lvar[i] ≤ x[i=1:2] ≤ uvar[i])
  set_start_value.(x, [-2.0; 1.0])
  @NLexpression(model, F1, 10 * (x[2] - x[1]^2))
  @NLexpression(model, F2, 1 - x[1])
  @NLconstraint(model, x[1] + x[2]^2 ≥ 0.0)
  @NLconstraint(model, x[1]^2 + x[2] ≥ 0.0)
  @NLconstraint(model, x[1]^2 + x[2]^2 ≥ 1)

  return MathOptNLSModel(model, [F1; F2], name="hs20")
end
