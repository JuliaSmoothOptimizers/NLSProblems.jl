# HS problem 65 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs65

"Hock-Schittkowski problem 65 in NLS format"
function hs65()

  nequ = 3
  F(x) = [x[1] - x[2];
          (x[1] + x[2] - 10) / 3;
          x[3] - 5]
  x0 = [-5.0; 5.0; 0.0]
  lvar, uvar = [-4.5; -4.5; -5.0], [4.5; 4.5; 5.0]

  c(x) = [48 - x[1]^2 - x[2]^2 - x[3]^2]
  lcon, ucon = zeros(1), zeros(1)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs65")
end
