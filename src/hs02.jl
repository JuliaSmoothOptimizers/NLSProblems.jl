# HS problem 2 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs02

"Hock-Schittkowski problem 2 in NLS format"
function hs02()

  model = Model()
  lvar = [-Inf; 1.5]
  @variable(model, x[i=1:2] >= lvar[i])
  setvalue(x, [-2.0; 1.0])
  @NLexpression(model, F1, 10 * (x[2] - x[1]^2))
  @NLexpression(model, F2, 1 - x[1])

  return MathProgNLSModel(model, [F1; F2], name="hs02")
end
