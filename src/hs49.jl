# HS problem 49 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs49

"Hock-Schittkowski problem 49 in NLS format"
function hs49()

  nequ = 4
  F(x) = [x[1] - x[2];
          x[3] - 1;
          (x[4] - 1)^2;
          (x[5] - 1)^3]
  x0 = [10.0; 7.0; 2.0; -3.0; 0.8]

  c(x) = [x[1] + x[2] + x[3] + 4 * x[4] - 7;
          x[3] + 5 * x[5] - 6]
  lcon, ucon = zeros(2), zeros(2)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs49")
end
