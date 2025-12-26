# HS problem 70 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. Montoison, Montreal, 06/2018.

export hs70

"Hock-Schittkowski problem 70 in NLS format"
function hs70(args...)
  nls = Model()
  x0 = [2; 4; 0.04; 2]
  uvar = [100; 100; 1; 100]
  @variable(nls, 0.00001 ≤ x[i = 1:4] ≤ uvar[i], start = x0[i])

  c = [(i ≥ 2) ? i - 1 : 0.1 for i = 1:19]
  yobs = [
    0.00189
    0.1038
    0.268
    0.506
    0.577
    0.604
    0.725
    0.898
    0.947
    0.845
    0.702
    0.528
    0.385
    0.257
    0.159
    0.0869
    0.0453
    0.01509
    0.00189
  ]

  @NLexpression(nls, b, x[3] + (1 - x[3]) * x[4])
  @NLexpression(
    nls,
    ycal[i = 1:19],
    (1 + 1 / (12 * x[2])) *
    (x[3] * b^x[2]) *
    ((x[2] / 6.2832)^(0.5)) *
    (c[i] / 7.685)^(x[2] - 1) *
    exp(x[2] - b * c[i] * x[2] / 7.658) +
    (1 + (1 / (12 * x[1]))) *
    (1 - x[3]) *
    (b / x[4])^x[1] *
    (x[1] / 6.2832)^0.5 *
    (c[i] / 7.658)^(x[1] - 1) *
    exp(x[1] - b * c[i] * x[1] / (7.658 * x[4]))
  )

  @NLexpression(nls, F[i = 1:19], ycal[i] - yobs[i])
  @constraint(nls, b ≥ 0)

  return MathOptNLSModel(nls, F, name = "hs70")
end
