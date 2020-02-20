# HS problem 49 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs49

"Hock-Schittkowski problem 49 in NLS format"
function hs49(args...)

  model = Model()
  @variable(model, x[1:5])
  set_start_value.(x, [10.0; 7.0; 2.0; -3.0; 0.8])
  @NLexpression(model, F1, x[1] - x[2])
  @NLexpression(model, F2, x[3] - 1)
  @NLexpression(model, F3, (x[4] - 1)^2)
  @NLexpression(model, F4, (x[5] - 1)^3)
  @constraint(model, x[1] + x[2] + x[3] + 4 * x[4] == 7)
  @constraint(model, x[3] + 5 * x[5] == 6)

  return MathOptNLSModel(model, [F1; F2; F3; F4], name="hs49")
end
