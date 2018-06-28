# TP problem 373 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp373

"Test problem 373 in NLS format"
function tp373()

  nls  = Model()
  x0   = [300; -100; -0.1997; -127; -151; 379; 421; 460; 426]
  @variable(nls, x[i=1:9], start=x0[i])

  @NLexpression(nls, F[i=1:6], 1*x[i+3])

  @NLconstraint(nls, x[1] + x[2]*exp(-5*x[3]) + x[4] - 127 == 0)
  @NLconstraint(nls, x[1] + x[2]*exp(-3*x[3]) + x[5] - 151 == 0)
  @NLconstraint(nls, x[1] + x[2]*exp(  -x[3]) + x[6] - 379 == 0)
  @NLconstraint(nls, x[1] + x[2]*exp(   x[3]) + x[7] - 421 == 0)
  @NLconstraint(nls, x[1] + x[2]*exp( 3*x[3]) + x[8] - 460 == 0)
  @NLconstraint(nls, x[1] + x[2]*exp( 5*x[3]) + x[9] - 426 == 0)

  return MathProgNLSModel(nls, F, name="tp373")
end