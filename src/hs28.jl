# HS problem 28 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs28

"Hock-Schittkowski problem 28 in NLS format"
function hs28(args...)
  model = Model()
  @variable(model, x[1:3])
  set_start_value.(x, [-4.0; 1.0; 1.0])
  @NLexpression(model, F[i = 1:2], x[i] + x[i + 1])
  @constraint(model, x[1] + 2 * x[2] + 3 * x[3] == 1)

  return MathOptNLSModel(model, F, name = "hs28")
end
