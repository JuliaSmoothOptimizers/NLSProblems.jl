# HS problem 57 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs57

"Hock-Schittkowski problem 57 in NLS format"
function hs57()

  a = [ 8;  8; 10; 10; 10; 10; 12; 12; 12; 12; 14;
       14; 14; 16; 16; 16; 18; 18; 20; 20; 20; 22;
       22; 22; 24; 24; 24; 26; 26; 26; 28; 28; 30;
       30; 30; 32; 32; 34; 36; 36; 38; 38; 40; 42]
  b = [0.49; 0.49; 0.48; 0.47; 0.48; 0.47; 0.46; 0.46; 0.45; 0.43; 0.45;
       0.43; 0.43; 0.44; 0.43; 0.43; 0.46; 0.45; 0.42; 0.42; 0.43; 0.41;
       0.41; 0.40; 0.42; 0.40; 0.40; 0.41; 0.40; 0.41; 0.41; 0.40; 0.40;
       0.40; 0.38; 0.41; 0.40; 0.40; 0.41; 0.38; 0.40; 0.40; 0.39; 0.39]
  nequ = 44
  F(x) = [b[i] - x[1] - (0.49 - x[1]) * exp(-x[2] * (a[i] - 8)) for i = 1:44]
  x0 = [0.42; 5.0]
  lvar, uvar = [0.4; -4.0], [Inf; Inf]

  c(x) = [0.49 * x[2] - x[1] * x[2] - 0.09]
  lcon, ucon = zeros(1), [Inf]

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs57")
end
