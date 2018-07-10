# TP problem 370 and 371 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp370, tp371

"Test problem 370 in NLS format"
function tp370(n :: Int=6; version :: String="tp370")

  nls  = Model()
  @variable(nls, x[i=1:n], start=0)

  @NLexpression(nls, FA, 1 * x[1])
  @NLexpression(nls, FB, x[2] - x[1]^2 - 1)
  @NLexpression(nls, FC[i=1:29], sum((j - 1) * x[j] * (i / 29)^(j - 2) for j=2:n) - sum(x[j] * (i / 29)^(j - 1) for j=1:n)^2 - 1)

  return MathProgNLSModel(nls, [FA; FB; FC], name=version)
end

"Test problem 371 in NLS format"
tp371(args...) = tp370(9, version="tp371")