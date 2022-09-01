# TP problem 337 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp337

"Test problem 337 in NLS format"
function tp337(args...)
  nls = Model()
  lvar = [-Inf; 1; -Inf]
  uvar = [Inf; Inf; 1]
  @variable(nls, lvar[i] ≤ x[i = 1:3] ≤ uvar[i], start = 1)

  @expression(nls, F1, 3 * x[1])
  @expression(nls, F2, x[2])
  @expression(nls, F3, 3 * x[3])

  @NLconstraint(nls, x[1] * x[2] - 1 ≥ 0)

  return MathOptNLSModel(nls, [F1; F2; F3], name = "tp337")
end
