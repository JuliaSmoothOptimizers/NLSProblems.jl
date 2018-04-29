# HS problem 13 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs13

"Hock-Schittkowski problem 13 in NLS format"
function hs13()

  nequ = 2
  F(x) = [x[1] - 2;
          x[2]]
  x0 = [-2.0; -2.0]
  lvar = [0.0; 0.0]

  c(x) = [(1 - x[1])^3 - x[2]]
  lcon, ucon = [0.0], [Inf]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, name="hs13")
end
