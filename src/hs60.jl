# HS problem 60 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs60

"Hock-Schittkowski problem 60 in NLS format"
function hs60()

  nequ = 3
  F(x) = [x[1] - 1;
          x[1] - x[2];
          (x[2] - x[3])^2]
  x0 = 2 * ones(3)
  lvar, uvar = -10 * ones(3), 10 * ones(3)

  c(x) = [x[1] * (1 + x[2]^2) + x[3]^4 - 4 - 3 * sqrt(2)]
  lcon, ucon = zeros(1), zeros(1)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs60")
end
