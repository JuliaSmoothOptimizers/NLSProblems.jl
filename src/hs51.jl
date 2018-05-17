# HS problem 51 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs51

"Hock-Schittkowski problem 51 in NLS format"
function hs51()

  model = Model()
  @variable(model, x[1:5])
  setvalue(x, [2.5; 0.5; 2.0; -1.0; 0.5])
  @NLexpression(model, F1, x[1] - x[2])
  @NLexpression(model, F2, x[2] + x[3] - 2)
  @NLexpression(model, F3, x[4] - 1)
  @NLexpression(model, F4, x[5] - 1)
  @constraint(model, x[1] + 3 * x[2] == 4)
  @constraint(model, x[3] + x[4] - 2 * x[5] == 0)
  @constraint(model, x[2] - x[5] == 0)

  return MathProgNLSModel(model, [F1; F2; F3; F4], name="hs51")
end
