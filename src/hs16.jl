# HS problem 16 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs16

"Hock-Schittkowski problem 16 in NLS format"
function hs16()

  nequ = 2
  F(x) = [10 * (x[2] - x[1]^2);
          1 - x[1]]
  x0 = [-2.0; 1.0]
  lvar = [-2.0; -Inf]
  uvar = [0.5; 1.0]

  c(x) = [x[1] + x[2]^2;
          x[1]^2 + x[2]]
  lcon, ucon = zeros(2), [Inf; Inf]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs16")
end
