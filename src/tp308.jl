# TP problem 308 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp308

"Test problem 308 in NLS format"
function tp308(args...)

  nls = Model()
  x0  = [3; 0.1]
  @variable(nls, x[i=1:2], start=x0[i])

  @NLexpression(nls, F1, x[1]^2 + x[2]^2 + x[1] * x[2])
  @NLexpression(nls, F2, sin(x[1]))
  @NLexpression(nls, F3, cos(x[2]))

  return MathProgNLSModel(nls, [F1; F2; F3], name="tp308")
end