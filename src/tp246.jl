# TP problem 246 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp246

"Test problem 246 in NLS format"
function tp246()

  nls = Model()
  x0  = [-1.2; 2; 0]
  @variable(nls, x[i=1:3], start=x0[i])

  @NLexpression(nls, F1, 10 * (x[3] - (0.5 * (x[1] + x[2]))^2))
  @NLexpression(nls, F2, 1 - x[1])
  @NLexpression(nls, F3, 1 - x[2])

  return MathProgNLSModel(nls, [F1; F2; F3], name="tp246")
end