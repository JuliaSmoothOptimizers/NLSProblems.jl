# HS problem 23 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs23

"Hock-Schittkowski problem 23 in NLS format"
function hs23()

  model = Model()
  @variable(model, -50 <= x[1:2] <= 50)
  setvalue(x, [3.0; 1.0])
  @NLexpression(model, F[i=1:2], x[i] + 0.0)
  @constraint(model, x[1] + x[2] >= 0)
  @NLconstraint(model, x[1]^2 + x[2]^2 >= 1)
  @NLconstraint(model, 9 * x[1]^2 + x[2]^2 >= 9)
  @NLconstraint(model, x[1]^2 - x[2] >= 0)
  @NLconstraint(model, x[2]^2 - x[1] >= 0)

  return MathProgNLSModel(model, F, name="hs23")
end
