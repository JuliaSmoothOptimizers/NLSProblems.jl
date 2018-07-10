# HS problem 13 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs13

"Hock-Schittkowski problem 13 in NLS format"
function hs13(args...)

  model = Model()
  @variable(model, x[1:2] >= 0.0, start=-2.0)
  @NLexpression(model, F1, x[1] - 2)
  @NLexpression(model, F2, x[2] + 0.0)
  @NLconstraint(model, (1 - x[1])^3 - x[2] >= 0.0)

  return MathProgNLSModel(model, [F1; F2], name="hs13")
end
