# TP problem 272 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp272

"Test problem 272 in NLS format"
function tp272(args...)

  nls = Model()
  x0  = [1; 2; 1; 1; 1; 1]
  @variable(nls, x[i=1:6], start=x0[i])

  t = [0.1 * i for i=1:13]
  y = exp.(-t) - 5 * exp.(-10 * t) + 3 * exp.(-4 * t)

  @NLexpression(nls, F[i=1:13], x[4] * exp(-x[1] * t[i]) - x[5] * exp(-x[2] * t[i]) + x[6] * exp(-x[3] * t[i]) - y[i])


  return MathOptNLSModel(nls, F, name="tp272")
end