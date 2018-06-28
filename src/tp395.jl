# TP problem 395 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp395

"Test problem 395 in NLS format"
function tp395()

  nls = Model()
  @variable(nls, x[i=1:50], start=2)

  @NLexpression(nls, FA[i=1:50], sqrt(i)*x[i])
  @NLexpression(nls, FB[i=1:50], sqrt(i)*x[i]^2)

  @NLconstraint(nls, sum(x[i]^2 for i=1:50) == 1)

  return MathProgNLSModel(nls, [FA; FB], name="tp395")
end