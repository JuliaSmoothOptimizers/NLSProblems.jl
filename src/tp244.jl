# TP problem 244 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp244

"Test problem 244 in NLS format"
function tp244(args...)

  nls = Model()
  x0  = [1; 2; 1]
  @variable(nls, 0 ≤ x[i=1:3] ≤ 10, start=x0[i])

  z = [0.1 * i for i=1:10]
  y = exp.(-z) - 5 * exp.(-10 * z)
  @NLexpression(nls, F[i=1:10], exp(-x[1] * z[i]) - x[3] * exp(-x[2] * z[i]) - y[i])

  return MathProgNLSModel(nls, F, name="tp244")
end