# HS problem 22 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs22

"Hock-Schittkowski problem 22 in NLS format"
function hs22(args...)
  model = Model()
  @variable(model, x[1:2], start = 2.0)
  @expression(model, F1, x[1] - 2.0)
  @expression(model, F2, x[2] - 1.0)
  @constraint(model, -x[1] - x[2] + 2 ≥ 0)
  @NLconstraint(model, -x[1]^2 + x[2] ≥ 0)

  return MathOptNLSModel(model, [F1; F2], name = "hs22")
end
