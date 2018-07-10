# TP problem 327 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp327

"Test problem 327 in NLS format"
function tp327(args...)

  nls = Model()
  x0  = [0.42; 5]
  @variable(nls, x[i=1:2] ≥ 0.4, start=x0[i])

  y = [0.49; 0.49; 0.48; 0.47; 0.48; 0.47; 0.46; 0.46; 0.45; 0.43; 0.45;
       0.43; 0.43; 0.44; 0.43; 0.43; 0.46; 0.45; 0.42; 0.42; 0.43; 0.41;
       0.41; 0.40; 0.42; 0.40; 0.40; 0.41; 0.40; 0.41; 0.41; 0.40; 0.40;
       0.40; 0.38; 0.41; 0.40; 0.40; 0.41; 0.38; 0.40; 0.40; 0.39; 0.39]

  z = [8;  8; 10; 10; 10; 10; 12; 12; 12; 12; 14;
      14; 14; 16; 16; 16; 18; 18; 20; 20; 20; 22;
      22; 22; 24; 24; 24; 26; 26; 26; 28; 28; 30;
      30; 30; 32; 32; 34; 36; 36; 38; 38; 40; 42]

  @NLexpression(nls, F[i=1:44], y[i] - x[1] - (0.49 - x[1]) * exp(-x[2] * (z[i] - 8)))

  @NLconstraint(nls, -0.09 - x[1] * x[2] + 0.49 * x[2] ≥ 0)

  return MathProgNLSModel(nls, F, name="tp327")
end