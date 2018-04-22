# HS problem 6 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs06

"Hock-Schittkowski problem 6 in NLS format"
function hs06()

  nequ = 1
  F(x) = [1.0 - x[1]]
  x0 = [-1.2; 1.0]

  c(x) = [10 * (x[2] - x[1]^2)]
  lcon, ucon = zeros(1), zeros(1)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon, name="hs06")
end
