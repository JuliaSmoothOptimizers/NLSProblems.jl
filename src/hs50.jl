# HS problem 50 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs50

"Hock-Schittkowski problem 50 in NLS format"
function hs50()

  nequ = 4
  F(x) = [x[1] - x[2];
          x[2] - x[3];
          (x[3] - x[4])^2;
          x[4] - x[5]]
  x0 = [35.0; -31.0; 11.0; 5.0; -5.0]

  c(x) = [x[1] + 2 * x[2] + 3 * x[3] - 6;
          x[2] + 2 * x[3] + 3 * x[4] - 6;
          x[3] + 2 * x[4] + 3 * x[5] - 6]
  lcon, ucon = zeros(3), zeros(3)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs50")
end
