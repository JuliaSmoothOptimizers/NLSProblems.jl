# TP problem 202 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp202

"Test problem 202 in NLS format"
function tp202(args...)
  nls = Model()
  x0 = [15; -2]
  @variable(nls, x[i = 1:2], start = x0[i])

  @NLexpression(nls, F1, -13 + x[1] - 2 * x[2] + 5 * x[2]^2 - x[2]^3)
  @NLexpression(nls, F2, -29 + x[1] - 14 * x[2] + x[2]^2 + x[2]^3)

  return MathOptNLSModel(nls, [F1; F2], name = "tp202")
end
