# TP problem 224 in NLS format without constants in the objective
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp224

"Test problem 224 in NLS format without constants in the objective"
function tp224(args...)

  nls = Model()
  x0  = [0.1; 0.1]
  @variable(nls, 0 ≤ x[i=1:2] ≤ 6, start=x0[i])

  @NLexpression(nls, F1, sqrt(2) * (x[1] - 12))
  @NLexpression(nls, F2, x[2] - 20)

  @constraint(nls, -18 ≤ - x[1] - 3 * x[2] ≤ 0)
  @constraint(nls, -8 ≤ - x[1] - x[2] ≤ 0)

  return MathProgNLSModel(nls, [F1; F2], name="tp224")
end