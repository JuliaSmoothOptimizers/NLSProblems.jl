# TP problem 298 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 298,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp298

"Test problem 298 in NLS format"
function tp298()

  nls = Model()
  @variable(nls, x[i=1:50], start=-1.2)

  @NLexpression(nls, FA[k=1:49], 10*(x[k+1] - x[k]^2))
  @NLexpression(nls, FB[k=1:49], 1 - x[k])

  return MathProgNLSModel(nls, [FA; FB], name="tp298")
end