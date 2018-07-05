# TP problem 303, 304 and 305 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp303, tp304, tp305

function tp303to305(n :: Int=20, version :: String="tp303")

  nls = Model()
  @variable(nls, x[i=1:n], start=0.1)

  @NLexpression(nls, FA[i=1:n], 1 * x[i])
  @NLexpression(nls, FB, sum(i / 2 * x[i] for i=1:n))
  @NLexpression(nls, FC, sum(i / 2 * x[i] for i=1:n)^2)

  return MathProgNLSModel(nls, [FA; FB; FC], name=version)
end

"Test problem 303 in NLS format"
tp303() = tp303to305(20, "tp303")

"Test problem 304 in NLS format"
tp304() = tp303to305(50, "tp304")

"Test problem 305 in NLS format"
tp305() = tp303to305(100, "tp305")