# TP problem 312 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp312

"Test problem 312 in NLS format"
function tp312()

  nls = Model()
  @variable(nls, x[i=1:2], start=1)

  @NLexpression(nls, F1, x[1]^2 + 12*x[2] - 1)
  @NLexpression(nls, F2, 49*x[1]^2 + 49*x[2]^2 + 84*x[1] + 2324*x[2] - 681)

  return MathProgNLSModel(nls, [F1; F2], name="tp312")
end