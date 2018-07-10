# TP problem 249 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp249

"Test problem 249 in NLS format"
function tp249(args...)

  nls  = Model()
  lvar = [1; -Inf; -Inf]
  @variable(nls, x[i=1:3] ≥ lvar[i], start=1)

  @NLexpression(nls, F[i=1:3], 1 * x[i])

  @NLconstraint(nls, x[1]^2 + x[2]^2 - 1 ≥ 0)

  return MathProgNLSModel(nls, F, name="tp249")
end