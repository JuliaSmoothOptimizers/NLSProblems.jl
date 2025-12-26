# HS problem 32 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs32

"Hock-Schittkowski problem 32 in NLS format"
function hs32(args...)
  model = Model()
  @variable(model, x[1:3] ≥ 0.0)
  set_start_value.(x, [0.1; 0.7; 0.2])
  @expression(model, F1, x[1] + 3 * x[2] + x[3])
  @expression(model, F2, 2 * (x[1] - x[2]))
  @constraint(model, 6 * x[2] + 4 * x[3] - x[1]^3 ≥ 3.0)
  @constraint(model, 1.0 - x[1] - x[2] - x[3] == 0.0)

  return MathOptNLSModel(model, [F1; F2], name = "hs32")
end
