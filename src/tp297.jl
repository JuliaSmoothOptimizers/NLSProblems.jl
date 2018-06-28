# TP problem 297 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 297,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp297

"Test problem 297 in NLS format"
function tp297()

  nls = Model()
  @variable(nls, x[i=1:30], start=-1.2)

  @NLexpression(nls, FA[k=1:29], 10*(x[k+1] - x[k]^2))
  @NLexpression(nls, FB[k=1:29], 1 - x[k])

  return MathProgNLSModel(nls, [FA; FB], name="tp297")
end