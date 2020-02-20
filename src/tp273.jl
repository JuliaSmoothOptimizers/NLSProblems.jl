# TP problem 273 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp273

"Test problem 273 in NLS format"
function tp273(args...)

  nls = Model()
  @variable(nls, x[i=1:6], start=0)

  @NLexpression(nls, FA[i=1:6], sqrt(160 - 10 * i) * (x[i] - 1))
  @NLexpression(nls, FB, sqrt(10) * sum((16 - i) * (x[i] - 1)^2 for i=1:6))

  return MathOptNLSModel(nls, [FA; FB], name="tp273")
end