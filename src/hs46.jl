# HS problem 46 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
#   Problem retrieved from
#   http://apmonitor.com/wiki/uploads/Apps/hs046.apm
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs46

"Hock-Schittkowski problem 46 in NLS format"
function hs46()

  nequ = 4
  F(x) = [x[1] - x[2];
          x[3] - 1.0;
          (x[4] - 1.0)^2;
          (x[5] - 1.0)^3]
  x0 = [sqrt(2) / 2; 1.75; 0.5; 2.0; 2.0]

  c(x) = [x[1]^2 * x[4] + sin(x[4] - x[5]);
          x[2] + x[3]^4 * x[4]^2]
  lcon =  ucon = [1.0; 2.0]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs46")
end
