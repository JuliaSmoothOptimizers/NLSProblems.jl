# TP problem 260 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp260

"Test problem 260 in NLS format"
function tp260(args...)
  nls = Model()
  x0 = [-3; -1; -3; -1]
  @variable(nls, x[i = 1:4], start = x0[i])

  @NLexpression(nls, F1, 10 * (x[2] - x[1]^2))
  @expression(nls, F2, 1 - x[1])
  @NLexpression(nls, F3, sqrt(90) * (x[4] - x[3]^2))
  @expression(nls, F4, 1 - x[3])
  @expression(nls, F5, sqrt(9.9) * (x[2] + x[4] - 2))
  @expression(nls, F6, sqrt(0.2) * (x[2] - 1))
  @expression(nls, F7, sqrt(0.2) * (x[4] - 1))

  return MathOptNLSModel(nls, [F1; F2; F3; F4; F5; F6; F7], name = "tp260")
end
