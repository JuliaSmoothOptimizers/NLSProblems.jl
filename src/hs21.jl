# HS problem 21 in NLS format without constants in the objective
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs21

"Hock-Schittkowski problem 21 in NLS format without constants in the objective"
function hs21(args...)
  model = Model()
  lvar = [2.0; -50.0]
  @variable(model, lvar[i] ≤ x[i = 1:2] ≤ 50, start = -1.0)
  @expression(model, F1, 0.1 * x[1])
  @expression(model, F2, x[2])
  @constraint(model, 10 * x[1] - x[2] ≥ 10)

  return MathOptNLSModel(model, [F1; F2], name = "hs21")
end
