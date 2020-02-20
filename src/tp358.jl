# TP problem 358 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp358

"Test problem 358 in NLS format"
function tp358(args...)

  nls  = Model()
  lvar = [-0.5; 1.5;   -2; 0.001; 0.001]
  uvar = [ 0.5; 2.5; -1.0;   0.1;   0.1]
  x0   = [ 0.5; 1.5; -1.0;  0.01;  0.02]
  @variable(nls, lvar[i] ≤ x[i=1:5] ≤ uvar[i], start=x0[i])

  t = [10 * (i - 1) for i=1:33]
  y = [0.844; 0.908; 0.932; 0.936; 0.925; 0.908; 0.881; 0.850; 0.818; 0.784; 0.751;
       0.718; 0.685; 0.658; 0.628; 0.603; 0.580; 0.558; 0.538; 0.522; 0.506; 0.490;
       0.478; 0.467; 0.457; 0.448; 0.438; 0.431; 0.424; 0.420; 0.414; 0.411; 0.406]

  @NLexpression(nls, F[i=1:33], y[i] - (x[1] + x[2] * exp(-x[4] * t[i]) + x[3] * exp(-x[5] * t[i])))

  return MathOptNLSModel(nls, F, name="tp358")
end