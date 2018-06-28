# TP problem 319 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp319

"Test problem 319 in NLS format"
function tp319()

  nls = Model()
  @variable(nls, x[i=1:2], start=0)

  @NLexpression(nls, F1, x[1] - 20)
  @NLexpression(nls, F2, x[2] + 20)

  @NLconstraint(nls, x[1]^2/100 + x[2]^2/16 - 1 == 0)
  return MathProgNLSModel(nls, [F1; F2], name="tp319")
end