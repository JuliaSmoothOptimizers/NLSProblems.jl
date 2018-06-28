# TP problem 307 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp307

"Test problem 307 in NLS format"
function tp307()

  nls = Model()
  x0  = [0.3; 0.4]
  @variable(nls, x[i=1:2]≥0, start=x0[i])

  y = [2 + 2*i for i=1:10]
  @NLexpression(nls, F[i=1:10], y[i] - exp(i*x[1]) - exp(i*x[2]))

  return MathProgNLSModel(nls, F, name="tp307")
end