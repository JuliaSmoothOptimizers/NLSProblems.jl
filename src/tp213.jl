# TP problem 213 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp213

"Test problem 213 in NLS format"
function tp213()

  nls = Model()
  x0  = [3; 1]
  @variable(nls, x[i=1:2], start=x0[i])

  @NLexpression(nls, F, (10 * (x[1] - x[2])^2 + (x[1] - 1)^2)^2)

  return MathProgNLSModel(nls, [F], name="tp213")
end