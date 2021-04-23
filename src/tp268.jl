# TP problem 268 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp268

"Test problem 268 in NLS format"
function tp268(args...)
  nls = Model()
  @variable(nls, x[i = 1:5], start = 1)

  d = [51; -61; -56; 69; 10; -12]
  D = [
    -74 80 18 -11 -4
    14 -69 21 28 0
    66 -72 -5 7 1
    -12 66 -30 -23 3
    3 8 -7 -4 1
    4 -12 4 4 0
  ]

  @NLexpression(nls, F[i = 1:6], sum(D[i, j] * x[j] for j = 1:5) - d[i])

  @constraint(nls, -x[1] - x[2] - x[3] - x[4] - x[5] + 5 ≥ 0)
  @constraint(nls, 10 * x[1] + 10 * x[2] - 3 * x[3] + 5 * x[4] + 4 * x[5] - 20 ≥ 0)
  @constraint(nls, -8 * x[1] + x[2] - 2 * x[3] - 5 * x[4] + 3 * x[5] + 40 ≥ 0)
  @constraint(nls, 8 * x[1] - x[2] + 2 * x[3] + 5 * x[4] - 3 * x[5] - 11 ≥ 0)
  @constraint(nls, -4 * x[1] - 2 * x[2] + 3 * x[3] - 5 * x[4] + x[5] + 30 ≥ 0)

  return MathOptNLSModel(nls, F, name = "tp268")
end
