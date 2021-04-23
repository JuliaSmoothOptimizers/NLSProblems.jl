# TP problem 324 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp324

"Test problem 324 in NLS format"
function tp324(args...)
  nls = Model()
  lvar = [2; -Inf]
  @variable(nls, x[i = 1:2] ≥ lvar[i], start = 2)

  @NLexpression(nls, F1, 0.1 * x[1])
  @NLexpression(nls, F2, 1 * x[2])

  @NLconstraint(nls, x[1] * x[2] - 25 ≥ 0)
  @NLconstraint(nls, x[1]^2 + x[2]^2 - 25 ≥ 0)

  return MathOptNLSModel(nls, [F1; F2], name = "tp324")
end
