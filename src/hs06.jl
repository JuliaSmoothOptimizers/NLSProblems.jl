# HS problem 6 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs06

"Hock-Schittkowski problem 6 in NLS format"
function hs06()

  model = Model()
  @variable(model, x[1:2])
  setvalue(x, [-1.2; 1.0])
  @NLexpression(model, F, 1.0 - x[1])
  @NLconstraint(model, 10 * (x[2] - x[1]^2) == 0)

  return MathProgNLSModel(model, [F], name="hs06")
end
