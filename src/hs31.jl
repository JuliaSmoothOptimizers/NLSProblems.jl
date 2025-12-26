# HS problem 31 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs31

"Hock-Schittkowski problem 31 in NLS format"
function hs31(args...)
  model = Model()
  lvar = [-10.0; 1.0; -10.0]
  uvar = [10.0; 10.0; 1.0]
  @variable(model, lvar[i] ≤ x[i = 1:3] ≤ uvar[i], start = 1.0)
  @expression(model, F1, 3.0 * x[1])
  @expression(model, F2, x[2])
  @expression(model, F3, 3.0 * x[3])
  @constraint(model, x[1] * x[2] ≥ 1)

  return MathOptNLSModel(model, [F1; F2; F3], name = "hs31")
end
