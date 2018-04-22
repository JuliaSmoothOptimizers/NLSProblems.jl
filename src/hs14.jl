# HS problem 14 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs14

"Hock-Schittkowski problem 14 in NLS format"
function hs14()

  nequ = 2
  F(x) = [x[1] - 2;
          x[2] - 1]
  x0 = [2.0; 2.0]

  c(x) = [-0.25 * x[1]^2 - x[2]^2 + 1.0;
          x[1] - 2 * x[2] + 1.0]
  lcon, ucon = zeros(2), [Inf; 0.0]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs14")
end
