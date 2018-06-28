# TP problem 290 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 290,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp290

"Test problem 290 in NLS format"
function tp290()

  nls = Model()
  @variable(nls, x[i=1:2], start=1)

  A = diagm([1.0; 2.0])
  @NLexpression(nls, F, sum(sum(x[i]*A[i,j]*x[j] for i=1:2) for j=1:2))

  return MathProgNLSModel(nls, [F], name="tp290")
end