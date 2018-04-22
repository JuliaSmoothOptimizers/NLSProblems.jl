# HS problem 48 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs48

"Hock-Schittkowski problem 48 in NLS format"
function hs48()

  nequ = 3
  F(x) = [x[1] - 1.0;
          x[2] - x[3];
          x[4] - x[5]]
  x0 = [3.0; 5.0; -3.0; 2.0; -2.0]

  c(x) = [sum(x) - 5;
          x[3] - 2 * (x[4] + x[5]) + 3]
  lcon, ucon = zeros(2), zeros(2)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs48")
end
