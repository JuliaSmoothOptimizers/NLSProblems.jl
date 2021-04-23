# NZF1 problem in NLS format
#
# Source: "Philippe Toint (private communication)"
#
# A. Montoison, Montreal, 05/2018.

export NZF1

"NZF1 problem in NLS format"
function NZF1(n::Int = 13)
  mod(n, 13) != 0 && @warn("NZF1: number of variables adjusted to be divisible by 13")
  nbis = max(1, div(n, 13))
  n = 13 * nbis
  l = div(n, 13)

  nls = Model()

  @variable(nls, x[i = 1:n], start = 1.0)

  @NLexpression(nls, F1[i = 1:l], sqrt(2) * (3 * x[i] - 60 + 1 / 10 * (x[i + 1] - x[i + 2])^2))
  @NLexpression(
    nls,
    F2[i = 1:l],
    sqrt(2) * (
      x[i + 1]^2 +
      x[i + 2]^2 +
      (x[i + 3]^2) * (1 + x[i + 3])^2 +
      x[i + 6] +
      x[i + 5] / (1 + x[i + 4]^2 + sin(x[i + 4] / 1000))
    )
  )
  @NLexpression(nls, F3[i = 1:l], sqrt(2) * (x[i + 6] + x[i + 7] - x[i + 8]^2 + x[i + 10]))
  @NLexpression(nls, F4[i = 1:l], sqrt(2) * (log(1 + x[i + 10]^2) + x[i + 11] - 5 * x[i + 12] + 20))
  @NLexpression(
    nls,
    F5[i = 1:l],
    sqrt(2) * (x[i + 4] + x[i + 5] + x[i + 5] * x[i + 9] + 10 * x[i + 9] - 50)
  )
  @NLexpression(nls, F6[i = 1:(l - 1)], sqrt(2) * (x[i + 6] - x[i + 19]))
  return MathOptNLSModel(nls, [F1; F2; F3; F4; F5; F6], name = "NZF1")
end
