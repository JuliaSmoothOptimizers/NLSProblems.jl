# TP problem 333 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp333

"Test problem 333 in NLS format"
function tp333()

  nls = Model()
  x0  = [30; 0.04; 3]
  @variable(nls, x[i=1:3], start=x0[i])

  a = [4; 5.75; 7.5; 24; 32; 48; 72; 96]
  y = [72.1; 65.6; 55.9; 17.1; 9.8; 4.5; 1.3; 0.6]
  @NLexpression(nls, F[i=1:8], (y[i] - x[1] * exp(-x[2] * a[i]) - x[3]) / y[i])

  return MathProgNLSModel(nls, F, name="tp333")
end