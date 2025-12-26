# TP problem 326 in NLS format without constants in the objective
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp326

"Test problem 326 in NLS format without constants in the objective"
function tp326(args...)
  nls = Model()
  x0 = [4; 3]
  @variable(nls, x[i = 1:2] ≥ 0, start = x0[i])

  @expression(nls, F1, x[1] - 8)
  @expression(nls, F2, x[2] - 5)

  @constraint(nls, 11 - x[1]^2 + 6 * x[1] - 4 * x[2] ≥ 0)
  @constraint(nls, x[1] * x[2] - 3 * x[2] - exp(x[1] - 3) + 1 ≥ 0)

  return MathOptNLSModel(nls, [F1; F2], name = "tp326")
end
