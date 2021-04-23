# TP problem 256 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp256

"Test problem 256 in NLS format"
function tp256(args...)
  nls = Model()
  x0 = [3; -1; 0; 1]
  @variable(nls, x[i = 1:4], start = x0[i])

  @NLexpression(nls, F1, x[1] + 10 * x[2])
  @NLexpression(nls, F2, sqrt(5) * (x[3] - x[4]))
  @NLexpression(nls, F3, (x[2] - 2 * x[3])^2)
  @NLexpression(nls, F4, sqrt(10) * (x[1] - x[4])^2)

  return MathOptNLSModel(nls, [F1; F2; F3; F4], name = "tp256")
end
