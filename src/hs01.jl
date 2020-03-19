# HS problem 1 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs01

"Hock-Schittkowski problem 1 in NLS format"
function hs01(args...)

  model = Model()
  lvar = [-Inf; -1.5]
  @variable(model, x[i=1:2] ≥ lvar[i])
  set_start_value.(x, [-2.0; 1.0])
  @NLexpression(model, F1, 10 * (x[2] - x[1]^2))
  @NLexpression(model, F2, 1 - x[1])

  return MathOptNLSModel(model, [F1; F2], name="hs01")
end
