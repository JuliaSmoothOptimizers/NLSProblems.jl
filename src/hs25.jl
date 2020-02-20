# HS problem 25 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs25

"Hock-Schittkowski problem 25 in NLS format"
function hs25(args...; m :: Int=99)

  model = Model()
  lvar = [  0.1;  0.0; 0.0]
  uvar = [100.0; 25.6; 5.0]
  @variable(model, lvar[i] <= x[i=1:3] <= uvar[i])
  set_start_value.(x, [100; 12.5; 3.0])
  u = [25 + (-50 * log(i / 100))^(2/3) for i = 1:m]
  @NLexpression(model, F[i=1:m], -i / 100 + exp(-(u[i] - x[2])^x[3] / x[1]))

  return MathOptNLSModel(model, F, name="hs25")
end
