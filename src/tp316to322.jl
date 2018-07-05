# TP problem 316, 317, 318, 319, 320, 321 and 322 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp316, tp317, tp318, tp319, tp320, tp321, tp322

function tp316to322(d :: Real=100, version="tp316")

  nls = Model()
  @variable(nls, x[i=1:2], start=0)

  @NLexpression(nls, F1, x[1] - 20)
  @NLexpression(nls, F2, x[2] + 20)

  @NLconstraint(nls, x[1]^2 / 100 + x[2]^2 / d  - 1 == 0)
  return MathProgNLSModel(nls, [F1; F2], name=version)
end

"Test problem 316 in NLS format"
tp316() = tp316to322(100, "tp316")

"Test problem 317 in NLS format"
tp317() = tp316to322(64, "tp317")

"Test problem 318 in NLS format"
tp318() = tp316to322(36, "tp318")

"Test problem 319 in NLS format"
tp319() = tp316to322(16, "tp319")

"Test problem 320 in NLS format"
tp320() = tp316to322(4, "tp320")

"Test problem 321 in NLS format"
tp321() = tp316to322(1, "tp321")

"Test problem 322 in NLS format"
tp322() = tp316to322(0.01, "tp322")