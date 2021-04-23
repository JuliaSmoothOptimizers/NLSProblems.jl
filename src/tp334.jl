# TP problem 334 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp334

"Test problem 334 in NLS format"
function tp334(args...)
  nls = Model()
  @variable(nls, x[i = 1:3], start = 1)

  u = [i for i = 1:15]
  v = [16 - i for i = 1:15]
  w = [min(u[i], v[i]) for i = 1:15]
  y = [
    0.14
    0.18
    0.22
    0.25
    0.29
    0.32
    0.35
    0.39
    0.37
    0.58
    0.73
    0.96
    1.34
    2.10
    4.39
  ]

  @NLexpression(nls, F[i = 1:15], y[i] - (x[1] + u[i] / (x[2] * v[i] + x[3] * w[i])))

  return MathOptNLSModel(nls, F, name = "tp334")
end
