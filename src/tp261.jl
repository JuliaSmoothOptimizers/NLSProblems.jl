# TP problem 261 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp261

"Test problem 261 in NLS format"
function tp261(args...)

  nls = Model()
  @variable(nls, x[i=1:4], start=0)

  @NLexpression(nls, F1, (exp(x[1]) - x[2])^2)
  @NLexpression(nls, F2, 10 * (x[2] - x[3])^3)
  @NLexpression(nls, F3, tan(x[3] - x[4])^2)
  @NLexpression(nls, F4, x[1]^4)
  @NLexpression(nls, F5, x[4] - 1) 

  return MathProgNLSModel(nls, [F1; F2; F3; F4; F5], name="tp261")
end