# TP problem 299 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 299,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp299

"Test problem 299 in NLS format"
function tp299()

  nls = Model()
  @variable(nls, x[i=1:100], start=-1.2)

  @NLexpression(nls, FA[k=1:99], 10*(x[k+1] - x[k]^2))
  @NLexpression(nls, FB[k=1:99], 1 - x[k])

  return MathProgNLSModel(nls, [FA; FB], name="tp299")
end