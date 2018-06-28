# TP problem 305 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp305

"Test problem 305 in NLS format"
function tp305()

  nls = Model()
  @variable(nls, x[i=1:100], start=0.1)

  @NLexpression(nls, FA[i=1:100], 1*x[i])
  @NLexpression(nls, FB, sum(i/2*x[i] for i=1:100))
  @NLexpression(nls, FC, sum(i/2*x[i] for i=1:100)^2)

  return MathProgNLSModel(nls, [FA; FB; FC], name="tp305")
end