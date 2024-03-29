# HS problem 26 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs26

"Hock-Schittkowski problem 26 in NLS format"
function hs26(args...)
  model = Model()
  @variable(model, x[1:3])
  set_start_value.(x, [-2.6; 2.0; 2.0])
  @expression(model, F1, x[1] - x[2])
  @NLexpression(model, F2, (x[2] - x[3])^2)
  @NLconstraint(model, (1 + x[2]^2) * x[1] + x[3]^4 == 3)

  return MathOptNLSModel(model, [F1; F2], name = "hs26")
end
