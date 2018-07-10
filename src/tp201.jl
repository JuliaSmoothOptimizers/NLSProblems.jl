# TP problem 201 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp201

"Test problem 201 in NLS format"
function tp201(args...)

  nls = Model()
  x0  = [8; 9]
  @variable(nls, x[i=1:2], start=x0[i])
  
  @NLexpression(nls, F1, 2 * (x[1] - 5))
  @NLexpression(nls, F2, x[2] - 6)

  return MathProgNLSModel(nls, [F1; F2], name="tp201")
end
