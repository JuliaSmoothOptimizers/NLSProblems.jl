# TP problem 295 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 295,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp295

"Test problem 295 in NLS format"
function tp295()

  nls = Model()
  x0  = [-1.2; 1; -1.2; 1; -1.2; 1; -1.2; 1; -1.2; 1]
  @variable(nls, x[i=1:10], start=x0[i])

  @NLexpression(nls, FA[k=1:9], 10*(x[k+1] - x[k]^2))
  @NLexpression(nls, FB[k=1:9], 1 - x[k])

  return MathProgNLSModel(nls, [FA; FB], name="tp295")
end