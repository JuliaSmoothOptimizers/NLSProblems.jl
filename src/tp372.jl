# TP problem 372 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp372

"Test problem 372 in NLS format"
function tp372()

  nls  = Model()
  lvar = [-Inf*ones(3); zeros(6)]
  x0   = [300; -100; -0.1997; -127; -151; 379; 421; 460; 426]
  @variable(nls, x[i=1:9] ≥ lvar[i], start=x0[i])

  @NLexpression(nls, F[i=1:6], 1 * x[i+3])

  y = [127; 151; 379; 421; 460; 426]
  for i=1:6
    @NLconstraint(nls, x[1] + x[2] * exp((2i - 7) * x[3]) + x[i+3] - y[i] ≥ 0)
    @NLconstraint(nls,-x[1] - x[2] * exp((2i - 7) * x[3]) + x[i+3] + y[i] ≥ 0)
  end
  
  return MathProgNLSModel(nls, F, name="tp372")
end