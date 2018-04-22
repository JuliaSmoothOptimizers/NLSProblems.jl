# HS problem 42 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs42

"Hock-Schittkowski problem 42 in NLS format"
function hs42()

  nequ = 4
  F(x) = [x[1] - 1;
          x[2] - 2;
          x[3] - 3;
          x[4] - 4]
  x0 = ones(4)

  c(x) = [x[1] - 2;
          x[3]^2 + x[4]^2 - 2]
  lcon, ucon = zeros(2), zeros(2)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs42")
end
