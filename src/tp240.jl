# TP problem 240 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp240

"Test problem 240 in NLS format"
function tp240(args...)

  nls = Model()
  x0  = [100; -1; 2.5]
  @variable(nls, x[i=1:3], start=x0[i])

  @NLexpression(nls, F1,  x[1] - x[2] + x[3])
  @NLexpression(nls, F2, -x[1] + x[2] + x[3])
  @NLexpression(nls, F3,  x[1] + x[2] - x[3])

  return MathProgNLSModel(nls, [F1; F2; F3], name="tp240")
end