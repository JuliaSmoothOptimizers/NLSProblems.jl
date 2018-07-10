# TP problem 225 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp225

"Test problem 225 in NLS format"
function tp225(args...)

  nls = Model()
  x0  = [3; 1]
  @variable(nls, x[i=1:2], start=x0[i])

  @NLexpression(nls, F1, 1 * x[1])
  @NLexpression(nls, F2, 1 * x[2])
  
  @constraint(nls, x[1] + x[2] - 1 ≥ 0)
  @NLconstraint(nls, x[1]^2 + x[2]^2 - 1 ≥ 0)
  @NLconstraint(nls, 9 * x[1]^2 + x[2]^2 - 9 ≥ 0)
  @NLconstraint(nls, x[1]^2 - x[2] ≥ 0)
  @NLconstraint(nls, x[2]^2 - x[1] ≥ 0)

  return MathProgNLSModel(nls, [F1; F2], name="tp225")
end