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

"Test problem 303 in NLS format"
function tp303(n::Int = 20; version::String = "tp303")
  nls = Model()
  @variable(nls, x[i = 1:n], start = 0.1)

  @expression(nls, FA[i = 1:n], x[i])
  @expression(nls, FB, sum(i / 2 * x[i] for i = 1:n))
  @NLexpression(nls, FC, sum(i / 2 * x[i] for i = 1:n)^2)

  return MathOptNLSModel(nls, [FA; FB; FC], name = version)
end

"Test problem 304 in NLS format"
tp304(args...) = tp303(50, version = "tp304")

"Test problem 305 in NLS format"
tp305(args...) = tp303(100, version = "tp305")
