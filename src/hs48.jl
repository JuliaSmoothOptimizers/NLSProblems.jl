# HS problem 48 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs48

"Hock-Schittkowski problem 48 in NLS format"
function hs48()

  model = Model()
  @variable(model, x[1:5])
  setvalue(x, [3.0; 5.0; -3.0; 2.0; -2.0])
  @NLexpression(model, F1, x[1] - 1.0)
  @NLexpression(model, F2, x[2] - x[3])
  @NLexpression(model, F3, x[4] - x[5])
  @constraint(model, sum(x) == 5)
  @constraint(model, x[3] - 2 * (x[4] + x[5]) == -3)

  return MathProgNLSModel(model, [F1; F2; F3], name="hs48")
end
