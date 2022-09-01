# TP problem 206, 207, 208, 209, 210 and 211 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp206, tp207, tp208, tp209, tp210, tp211

"Test problem 206 in NLS format"
function tp206(args...; a::Real = 1, b::Real = 10, c::Int = 2, version::String = "tp206")
  nls = Model()
  x0 = [-1.2; 1]
  @variable(nls, x[i = 1:2], start = x0[i])

  @NLexpression(nls, F1, a * (x[2] - x[1]^c))
  @expression(nls, F2, b * (1 - x[1]))

  return MathOptNLSModel(nls, [F1; F2], name = version)
end

"Test problem 207 in NLS format"
tp207(args...) = tp206(a = 1, b = 1, c = 2, version = "tp207")

"Test problem 208 in NLS format"
tp208(args...) = tp206(a = 10, b = 1, c = 2, version = "tp208")

"Test problem 209 in NLS format"
tp209(args...) = tp206(a = 100, b = 1, c = 2, version = "tp209")

"Test problem 210 in NLS format"
tp210(args...) = tp206(a = 1000, b = 1, c = 2, version = "tp210")

"Test problem 211 in NLS format"
tp211(args...) = tp206(a = 10, b = 1, c = 3, version = "tp211")
