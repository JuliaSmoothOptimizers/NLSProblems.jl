# HS problem 79 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs79

"Hock-Schittkowski problem 79 in NLS format"
function hs79()

  nequ = 5
  F(x) = [x[1] - 1;
          x[1] - x[2];
          x[2] - x[3];
          (x[3] - x[4])^2;
          (x[4] - x[5])^2]
  x0 = 2 * ones(5)

  c(x) = [x[1] + x[2]^2 + x[3]^3 - 2 - 3 * sqrt(2);
          x[2] - x[3]^2 + x[4] + 2 - 2 * sqrt(2);
          x[1] * x[5] - 2]
  lcon, ucon = zeros(3), zeros(3)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs79")
end
