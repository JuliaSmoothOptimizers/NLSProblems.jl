# HS problem 31 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs31

"Hock-Schittkowski problem 31 in NLS format"
function hs31()

  nequ = 3
  F(x) = [3.0 * x[1];
          x[2];
          3.0 * x[3]]
  x0 = ones(3)
  lvar = [-10.0; 1.0; -10.0]
  uvar = [10.0; 10.0; 1.0]

  c(x) = [x[1] * x[2] - 1]
  lcon, ucon = [0.0], [Inf]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs31")
end
