# TP problem 293 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 293,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp293

"Test problem 293 in NLS format"
function tp293()

  nls = Model()
  @variable(nls, x[i=1:50], start=1)

  A = diagm([i for i=1:50])
  @NLexpression(nls, F, sum(sum(x[i]*A[i,j]*x[j] for i=1:50) for j=1:50))

  return MathProgNLSModel(nls, [F], name="tp293")
end