# HS problem 43 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs43

"Hock-Schittkowski problem 43 in NLS format"
function hs43()

  nequ = 4
  F(x) = [x[1] - 5/2;
          x[2] - 5/2;
          sqrt(2) * (x[3] - 21 / 4);
          x[4] + 7/2]
  x0 = zeros(4)

  c(x) = [8 - x[1]^2 - x[2]^2 - x[3]^2 - x[4]^2 - x[1] + x[2] - x[3] + x[4];
          10 - x[1]^2 - 2 * x[2]^2 - x[3]^2 - 2 * x[4]^2 + x[1] + x[4];
          5 - 2 * x[1]^2 - x[2]^2 - x[3]^2 - 2 * x[1] + x[2] + x[4]]
  lcon, ucon = zeros(3), fill(Inf, 3)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs43")
end
