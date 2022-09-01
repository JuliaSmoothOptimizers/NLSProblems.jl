# TP problem 352 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp352

"Test problem 352 in NLS format"
function tp352(args...)
  nls = Model()
  x0 = [25; 5; -5; -1]
  @variable(nls, x[i = 1:4], start = x0[i])

  t = [0.2 * i for i = 1:20]
  @expression(nls, FA[i = 1:20], x[1] + x[2] * t[i] - exp(t[i]))
  @expression(nls, FB[i = 1:20], x[3] + x[4] * sin(t[i]) - cos(t[i]))

  return MathOptNLSModel(nls, [FA; FB], name = "tp352")
end
