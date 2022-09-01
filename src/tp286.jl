# TP problem 286 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 286,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp286

"Test problem 286 in NLS format"
function tp286(args...)
  nls = Model()
  x0 = [-1.2 * ones(10); ones(10)]
  @variable(nls, x[i = 1:20], start = x0[i])

  @NLexpression(nls, FA[i = 1:10], 10 * (x[i]^2 - x[i + 10]))
  @expression(nls, FB[i = 1:10], x[i] - 1)

  return MathOptNLSModel(nls, [FA; FB], name = "tp286")
end
