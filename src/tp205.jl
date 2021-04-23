# TP problem 205 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp205

"Test problem 205 in NLS format"
function tp205(args...)
  nls = Model()
  x0 = [0; 0]
  @variable(nls, x[i = 1:2], start = x0[i])

  c = [1.5; 2.25; 2.625]
  @NLexpression(nls, F[i = 1:3], c[i] - x[1] * (1 - x[2]^i))

  return MathOptNLSModel(nls, F, name = "tp205")
end
