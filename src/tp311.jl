# TP problem 311 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp311

"Test problem 311 in NLS format"
function tp311(args...)
  nls = Model()
  @variable(nls, x[i = 1:2], start = 1)

  @NLexpression(nls, F1, x[1]^2 + x[2] - 11)
  @NLexpression(nls, F2, x[1] + x[2]^2 - 7)

  return MathOptNLSModel(nls, [F1; F2], name = "tp311")
end
