# HS problem 50 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs50

"Hock-Schittkowski problem 50 in NLS format"
function hs50(args...)
  model = Model()
  @variable(model, x[1:5])
  set_start_value.(x, [35.0; -31.0; 11.0; 5.0; -5.0])
  @expression(model, F1, x[1] - x[2])
  @expression(model, F2, x[2] - x[3])
  @NLexpression(model, F3, (x[3] - x[4])^2)
  @expression(model, F4, x[4] - x[5])
  @constraint(model, [i = 1:3], x[i] + 2 * x[i + 1] + 3 * x[i + 2] == 6)

  return MathOptNLSModel(model, [F1; F2; F3; F4], name = "hs50")
end
