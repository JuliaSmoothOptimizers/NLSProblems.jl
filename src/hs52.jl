# HS problem 52 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs52

"Hock-Schittkowski problem 52 in NLS format"
function hs52(args...)
  model = Model()
  @variable(model, x[1:5], start = 2.0)
  @expression(model, F1, 4 * x[1] - x[2])
  @expression(model, F2, x[2] + x[3] - 2)
  @expression(model, F3, x[4] - 1)
  @expression(model, F4, x[5] - 1)
  @constraint(model, x[1] + 3 * x[2] == 0)
  @constraint(model, x[3] + x[4] - 2 * x[5] == 0)
  @constraint(model, x[2] - x[5] == 0)

  return MathOptNLSModel(model, [F1; F2; F3; F4], name = "hs52")
end
