# TP problem 235 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp235

"Test problem 235 in NLS format"
function tp235(args...)

  nls = Model()
  x0  = [-2; 3; 1]
  @variable(nls, x[i=1:3], start=x0[i])

  @NLexpression(nls, F1, 0.1 * (x[1] - 1))
  @NLexpression(nls, F2, x[2] - x[1]^2)

  @NLconstraint(nls, x[1] + x[3]^2 + 1 == 0)

  return MathProgNLSModel(nls, [F1; F2], name="tp235")
end