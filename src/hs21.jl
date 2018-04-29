# HS problem 21 in NLS format without constants in the objective
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs21

"Hock-Schittkowski problem 21 in NLS format without constants in the objective"
function hs21()

  nequ = 2
  F(x) = [0.1 * x[1];
          x[2]]
  x0 = [-1.0; -1.0]
  lvar = [2.0; -50.0]
  uvar = [50.0; 50.0]

  c(x) = [10 * x[1] - x[2] - 10]
  lcon, ucon = [0.0], [Inf]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs21")
end
