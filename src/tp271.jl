# TP problem 271 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp271

"Test problem 271 in NLS format"
function tp271(args...)
  nls = Model()
  @variable(nls, x[i = 1:6], start = 0)

  @expression(nls, F[i = 1:6], sqrt(160 - 10 * i) * (x[i] - 1))

  return MathOptNLSModel(nls, F, name = "tp271")
end
