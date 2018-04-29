# HS problem 22 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs22

"Hock-Schittkowski problem 22 in NLS format"
function hs22()

  nequ = 2
  F(x) = [x[1] - 2.0;
          x[2] - 1.0]
  x0 = [2.0; 2.0]

  c(x) = [-x[1] - x[2] + 2;
          -x[1]^2 + x[2]]
  lcon, ucon = zeros(2), [Inf; Inf]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs22")
end
