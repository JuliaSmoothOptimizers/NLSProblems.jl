# HS problem 70 in NLS format
#
#   Source:
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 187,
#   Springer Verlag Berlin Heidelberg, 1981
#   10.1007/978-3-642-48320-2
#
# A. S. Siqueira, Curitiba/BR, 04/2018.

export hs70

"Hock-Schittkowski problem 70 in NLS format"
function hs70()

  a = [i == 1 ? 0.1 : i - 1 for i = 1:19]
  yobs = [0.00189; 0.1038;   0.268;   0.506; 0.577;
            0.604;  0.725;   0.898;   0.947; 0.845;
            0.702;  0.528;   0.385;   0.257; 0.159;
           0.0869; 0.0453; 0.01509; 0.00189]
  nequ = 19
  F(x) = begin
    b = x[3] + (1 - x[3]) * x[4]
    [ (1 + 1 / 12x[2]) * (x[3] * b^x[2] * sqrt(x[2] / 6.2832) * (a[i] / 7.685)^(x[2] - 1) * exp(x[2] - b * a[i] * x[2] / 7.658)) + (1 + 1 / 12x[1]) * ((1 - x[3]) * (b / x[4])^x[1] * sqrt(x[1] / 6.2832) * (a[i] / 7.658)^(x[1] - 1) * exp(x[1] - b * a[i] * x[1] / 7.658x[4])) - yobs[i] for i = 1:19]
  end
  x0 = [2.0; 4.0; 0.04; 2.0]
  lvar = [0.0001; 0.0001; 0.0001; 0.0001]
  uvar = [100.0; 100.0; 1.0; 100.0]

  c(x) = [x[3] + (1 - x[3]) * x[4]]
  lcon, ucon = zeros(1), zeros(1)

  return ADNLSModel(F, x0, nequ, c=c, lcon=lcon, ucon=ucon,
                    lvar=lvar, uvar=uvar, name="hs70")
end
