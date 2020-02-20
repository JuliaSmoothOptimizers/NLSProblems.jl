# TP problem 282 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp282

"Test problem 282 in NLS format"
function tp282(args...)

  nls = Model()
  x0  = [-1.2; zeros(9)]
  @variable(nls, x[i=1:10], start=x0[i])

  @NLexpression(nls, FA, x[1] - 1)
  @NLexpression(nls, FB, x[10] - 1)
  @NLexpression(nls, FC[i=1:9], sqrt(100 - 10 * i) * (x[i]^2 - x[i+1]))

  return MathOptNLSModel(nls, [FA; FB; FC], name="tp282")
end