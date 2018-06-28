# TP problem 344 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp344

"Test problem 344 in NLS format"
function tp344()

  nls = Model()
  @variable(nls, x[i=1:3], start=2)

  @NLexpression(nls, F1, x[1] - 1)
  @NLexpression(nls, F2, x[1] - x[2])
  @NLexpression(nls, F3, (x[2] - x[3])^2)

  @NLconstraint(nls, x[1]*(1 + x[2]^2) + x[3]^4 - 4 - 3*sqrt(2) == 0)
  
  return MathProgNLSModel(nls, [F1; F2; F3], name="tp344")
end