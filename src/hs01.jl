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
function hs01()

  nequ = 2
  F(x) = [10 * (x[2] - x[1]^2); 1 - x[1]]
  x0 = [-2.0; 1.0]
  lvar = [-Inf; -1.5]

  return ADNLSModel(F, x0, nequ, lvar=lvar, name="hs01")
end
