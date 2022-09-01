# TP problem 269 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp269

"Test problem 269 in NLS format"
function tp269(args...)
  nls = Model()
  @variable(nls, x[i = 1:5], start = 2)

  @expression(nls, F1, x[1] - x[2])
  @expression(nls, F2, x[2] + x[3] - 2)
  @expression(nls, F3, x[4] - 1)
  @expression(nls, F4, x[5] - 1)

  @constraint(nls, x[1] + 3 * x[2] == 0)
  @constraint(nls, x[3] + x[4] - 2 * x[5] == 0)
  @constraint(nls, x[2] - x[5] == 0)

  return MathOptNLSModel(nls, [F1; F2; F3; F4], name = "tp269")
end
