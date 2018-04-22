# HS problem 53 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs53

"Hock-Schittkowski problem 53 in NLS format"
function hs53()

  nequ = 4
  F(x) = [x[1] - x[2];
          x[2] + x[3] - 2;
          x[4] - 1;
          x[5] - 1]
  x0 = 2 * ones(5)
  lvar, uvar = -10 * ones(5), 10 * ones(5)

  c(x) = [x[1] + 3 * x[2];
          x[3] + x[4] - 2 * x[5];
          x[2] - x[5]]
  lcon, ucon = zeros(3), zeros(3)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs53")
end
