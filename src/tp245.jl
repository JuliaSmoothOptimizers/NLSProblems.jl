# TP problem 245 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp245

"Test problem 245 in NLS format"
function tp245()

  nls = Model()
  x0  = [0; 10; 20]
  @variable(nls, x[i=1:3], start=x0[i])

  t = [0.1 * i for i=1:10]
  @NLexpression(nls, F[i=1:10], exp(-x[1] * t[i]) - exp(-x[2] * t[i]) - x[3] * (exp(-t[i]) - exp(-10 * t[i])))

  return MathProgNLSModel(nls, F, name="tp245")
end