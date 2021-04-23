# HS problem 53 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs53

"Hock-Schittkowski problem 53 in NLS format"
function hs53(args...)
  model = Model()
  @variable(model, -10 ≤ x[1:5] ≤ 10, start = 2.0)
  @NLexpression(model, F1, x[1] - x[2])
  @NLexpression(model, F2, x[2] + x[3] - 2)
  @NLexpression(model, F3, x[4] - 1)
  @NLexpression(model, F4, x[5] - 1)
  @constraint(model, x[1] + 3 * x[2] == 0)
  @constraint(model, x[3] + x[4] - 2 * x[5] == 0)
  @constraint(model, x[2] - x[5] == 0)

  return MathOptNLSModel(model, [F1; F2; F3; F4], name = "hs53")
end
