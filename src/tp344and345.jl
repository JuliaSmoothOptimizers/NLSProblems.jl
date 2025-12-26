# TP problem 344 and 345 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp344, tp345

"Test problem 344 in NLS format"
function tp344(args...; x0::Real = 2, version::String = "tp344")
  nls = Model()
  @variable(nls, x[i = 1:3], start = x0)

  @expression(nls, F1, x[1] - 1)
  @expression(nls, F2, x[1] - x[2])
  @NLexpression(nls, F3, (x[2] - x[3])^2)

  @constraint(nls, x[1] * (1 + x[2]^2) + x[3]^4 - 4 - 3 * sqrt(2) == 0)

  return MathOptNLSModel(nls, [F1; F2; F3], name = version)
end

"Test problem 345 in NLS format"
tp345(args...) = tp344(x0 = 0, version = "tp345")
