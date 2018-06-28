# TP problem 267 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp267

"Test problem 267 in NLS format"
function tp267()

  nls = Model()
  @variable(nls, x[i=1:5], start=2)

  z = [0.1*i for i=1:11]
  y = [exp(-z[i]) - 5*exp(-10*z[i]) + 3*exp(-4*z[i]) for i=1:11]

  @NLexpression(nls, F[i=1:11], x[3]*exp(-x[1]*z[i]) -x[4]*exp(-x[2]*z[i]) + 3*exp(-x[5]*z[i]) - y[i])

  return MathProgNLSModel(nls, F, name="tp267")
end