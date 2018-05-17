# HS problem 65 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs65

"Hock-Schittkowski problem 65 in NLS format"
function hs65()

  model = Model()
  lvar, uvar = [-4.5; -4.5; -5.0], [4.5; 4.5; 5.0]
  @variable(model, lvar[i] <= x[i=1:3] <= uvar[i])
  setvalue(x, [-5.0; 5.0; 0.0])
  @NLexpression(model, F1, x[1] - x[2])
  @NLexpression(model, F2, (x[1] + x[2] - 10) / 3)
  @NLexpression(model, F3, x[3] - 5)
  @NLconstraint(model, 48 - x[1]^2 - x[2]^2 - x[3]^2 == 0)

  return MathProgNLSModel(model, [F1; F2; F3], name="hs65")
end
