# TP problem 394 and 395 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp394, tp395

"Test problem 394 in NLS format"
function tp394(n::Int = 20; version::String = "tp394")
  nls = Model()
  @variable(nls, x[i = 1:n], start = 2)

  @NLexpression(nls, FA[i = 1:n], sqrt(i) * x[i])
  @NLexpression(nls, FB[i = 1:n], sqrt(i) * x[i]^2)

  @NLconstraint(nls, sum(x[i]^2 for i = 1:n) == 1)

  return MathOptNLSModel(nls, [FA; FB], name = version)
end

"Test problem 395 in NLS format"
tp395(args...) = tp394(50, version = "tp395")
