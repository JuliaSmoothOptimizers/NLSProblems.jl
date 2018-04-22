# HS problem 28 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs28

"Hock-Schittkowski problem 28 in NLS format"
function hs28()

  nequ = 2
  F(x) = [x[1] + x[2];
          x[2] + x[3]]
  x0 = [-4.0; 1.0; 1.0]

  c(x) = [x[1] + 2 * x[2] + 3 * x[3] - 1]
  lcon, ucon = zeros(1), zeros(1)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs28")
end
