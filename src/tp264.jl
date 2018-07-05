# TP problem 264 in NLS format without constants in the objective
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp264

"Test problem 264 in NLS format without constants in the objective"
function tp264()

  nls = Model()
  @variable(nls, x[i=1:4], start=0)

  @NLexpression(nls, F1, x[1] - 5/2)
  @NLexpression(nls, F2, x[2] - 5/2)
  @NLexpression(nls, F3, 2 * (x[3] - 21/4))
  @NLexpression(nls, F4, x[4] + 7/2)

  @NLconstraint(nls, -x[1]^2 - x[2]^2 - x[3]^2 - x[4]^2 - x[1] + x[2] + x[3] + x[4] + 8 ≥ 0)
  @NLconstraint(nls, -x[1]^2 - 2 * x[2]^2 - x[3]^2 - 2 * x[4]^2 + x[1] + x[4] + 9 ≥ 0)
  @NLconstraint(nls, -2 * x[1]^2 - x[2]^2 - x[3]^2 - 2 * x[1] + x[2] + x[4] + 5 ≥ 0)
  return MathProgNLSModel(nls, [F1; F2; F3; F4], name="tp264")
end