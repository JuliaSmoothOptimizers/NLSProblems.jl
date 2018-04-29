# HS problem 61 in NLS format without constants in the objective
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs61

"Hock-Schittkowski problem 61 in NLS format without constants in the objective"
function hs61()

  nequ = 3
  F(x) = [2 * (x[1] - 33/8);
          sqrt(2) * (x[2] + 4);
          sqrt(2) * (x[3] - 6)]
  x0 = zeros(3)

  c(x) = [3 * x[1] - 2 * x[2]^2 - 7;
          4 * x[1] - 3 * x[3]^2 - 11]
  lcon, ucon = zeros(2), zeros(2)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    name="hs61")
end
