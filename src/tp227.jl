# TP problem 227 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp227

"Test problem 227 in NLS format"
function tp227(args...)
  nls = Model()
  x0 = [0.5; 0.5]
  @variable(nls, x[i = 1:2], start = x0[i])

  @expression(nls, F1, x[1] - 2)
  @expression(nls, F2, x[2] - 1)

  @constraint(nls, x[2] - x[1]^2 ≥ 0)
  @constraint(nls, x[1] - x[2]^2 ≥ 0)

  return MathOptNLSModel(nls, [F1; F2], name = "tp227")
end
