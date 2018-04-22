# HS problem 77 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs77

"Hock-Schittkowski problem 77 in NLS format"
function hs77()

  nequ = 5
  F(x) = [x[1] - 1;
          x[1] - x[2];
          x[3] - 1;
          (x[4] - 1)^2;
          (x[5] - 1)^3]
  x0 = 2 * ones(5)

  c(x) = [x[1]^2 * x[4] + sin(x[4] - x[5]) - 2 * sqrt(2);
          x[2] + x[3]^4 * x[4]^2 - 8 - sqrt(2)]
  lcon, ucon = zeros(2), zeros(2)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs77")
end
