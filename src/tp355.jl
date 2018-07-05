# TP problem 355 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp355

"Test problem 355 in NLS format"
function tp355()

  nls  = Model()
  lvar = [0.1; 0.1; 0; 0]
  @variable(nls, x[i=1:4] ≥ lvar[i], start=0)

  @NLexpression(nls, r1, 11 - x[1] * x[4] - x[2] * x[4] + x[3] * x[4])
  @NLexpression(nls, r2, x[1] + 10 * x[2] - x[3] + x[4] + x[2] * x[4] * (x[3] - x[1]))
  @NLexpression(nls, r3, 11 - 4 * x[1] * x[4] - 4 * x[2] * x[4] + x[3] * x[4])
  @NLexpression(nls, r4, 2 * x[1] + 20 * x[2] - 0.5 * x[3] + 2 * x[4] + 2 * x[2] * x[4] * (x[3] - 4 * x[1]))
  
  @NLconstraint(nls, r1^2 + r2^2 - r3^2 - r4^2 == 0)

  return MathProgNLSModel(nls, [r1; r2], name="tp355")
end