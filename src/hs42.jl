# HS problem 42 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs42

"Hock-Schittkowski problem 42 in NLS format"
function hs42()

  model = Model()
  @variable(model, x[1:4], start=1.0)
  @NLexpression(model, F[i=1:4], x[i] - i)
  @constraint(model, x[1] == 2.0)
  @NLconstraint(model, x[3]^2 + x[4]^2 == 2.0)

  return MathProgNLSModel(model, F, name="hs42")
end
