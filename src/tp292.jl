# TP problem 292 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 292,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp292

"Test problem 292 in NLS format"
function tp292()

  nls = Model()
  @variable(nls, x[i=1:30], start=1)

  A = diagm([i for i=1:30])
  @NLexpression(nls, F, sum(sum(x[i]*A[i,j]*x[j] for i=1:30) for j=1:30))

  return MathProgNLSModel(nls, [F], name="tp292")
end