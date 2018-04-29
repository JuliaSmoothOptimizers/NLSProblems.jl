# HS problem 23 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs23

"Hock-Schittkowski problem 23 in NLS format"
function hs23()

  nequ = 2
  F(x) = x
  x0 = [3.0; 1.0]
  lvar = [-50.0; -50.0]
  uvar = [ 50.0;  50.0]

  c(x) = [x[1] + x[2] - 1;
          x[1]^2 + x[2]^2 - 1;
          9 * x[1]^2 + x[2]^2 - 9;
          x[1]^2 - x[2];
          x[2]^2 - x[1]]
  lcon, ucon = zeros(5), fill(Inf, 5)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs23")
end
