# TP problem 247 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp247

"Test problem 247 in NLS format"
function tp247(args...)

  nls  = Model()
  x0   = [-1; 0; 0]
  lvar = [0.1; -Inf; -2.5]
  uvar = [Inf;  Inf;  7.5]
  @variable(nls, lvar[i] ≤ x[i=1:3] ≤ uvar[i], start=x0[i])

  u_aux(t) = (t > 0 ? 0.0 : 0.5)
  JuMP.register(nls, :u_aux, 1, u_aux, autodiff=true)

  @NLexpression(nls, F1, 10 * (x[3] - 10 * (u_aux(x[1]) + atan(x[2] / x[1]) / (2π))))
  @NLexpression(nls, F2, sqrt(x[1]^2 + x[2]^2) - 1)
  @NLexpression(nls, F3, 1 * x[3])

  return MathProgNLSModel(nls, [F1; F2; F3], name="tp247")
end