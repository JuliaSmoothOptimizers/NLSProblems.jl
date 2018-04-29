# HS problem 30 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs30

"Hock-Schittkowski problem 30 in NLS format"
function hs30()

  nequ = 3
  F(x) = x
  x0 = ones(3)
  lvar = [1.0; -10.0; -10.0]
  uvar = [10.0; 10.0; 10.0]

  c(x) = [x[1]^2 + x[2]^2 - 1]
  lcon, ucon = [0.0], [Inf]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs30")
end
