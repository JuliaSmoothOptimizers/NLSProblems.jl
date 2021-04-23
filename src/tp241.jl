# TP problem 241 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp241

"Test problem 241 in NLS format"
function tp241(args...)
  nls = Model()
  x0 = [1; 2; 0]
  @variable(nls, x[i = 1:3], start = x0[i])

  @NLexpression(nls, F1, x[1]^2 + x[2]^2 + x[3]^2 - 1)
  @NLexpression(nls, F2, x[1]^2 + x[2]^2 + (x[3] - 2)^2 - 1)
  @NLexpression(nls, F3, x[1] + x[2] + x[3] - 1)
  @NLexpression(nls, F4, x[1] + x[2] - x[3] + 1)
  @NLexpression(nls, F5, x[1]^3 + 3 * x[2]^2 + (5 * x[3] - x[1] + 1)^2 - 36)

  return MathOptNLSModel(nls, [F1; F2; F3; F4; F5], name = "tp241")
end
