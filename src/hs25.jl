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
function hs25(;nequ = 99)

  u = [25 + (-50 * log(0.01i))^(2/3) for i = 1:nequ]
  F(x) = [-0.01i + exp(-(u[i] - x[2])^x[3] / x[1]) for i = 1:nequ]
  x0 = [100; 12.5; 3.0]
  lvar = [  0.1;  0.0; 0.0]
  uvar = [100.0; 25.6; 5.0]

  return ADNLSModel(F, x0, nequ, lvar=lvar, uvar=uvar, name="hs25")
end
