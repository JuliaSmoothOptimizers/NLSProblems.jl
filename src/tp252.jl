# TP problem 252 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp252

"Test problem 252 in NLS format"
function tp252(args...)

  nls  = Model()
  x0   = [-1; 2; 2]
  uvar = [-1; Inf; Inf]
  @variable(nls, x[i=1:3] ≤ uvar[i], start=x0[i])

  @NLexpression(nls, F1, 0.1 * (x[1] - 1))
  @NLexpression(nls, F2, x[2] - x[1]^2)

  @NLconstraint(nls, x[1] + x[3]^2 + 1 == 0)

  return MathOptNLSModel(nls, [F1; F2], name="tp252")
end