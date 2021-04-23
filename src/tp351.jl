# TP problem 351 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp351

"Test problem 351 in NLS format"
function tp351(args...)
  nls = Model()
  x0 = [2.7; 90; 1500; 10]
  @variable(nls, x[i = 1:4], start = x0[i])

  a = [0.0; 0.000428; 0.00100; 0.00161; 0.00209; 0.00348; 0.00525]
  b = [7.391; 11.18; 16.44; 16.20; 22.20; 24.02; 31.32]
  @NLexpression(
    nls,
    F[i = 1:7],
    100 * ((x[1]^2 + a[i] * x[2]^2 + a[i]^2 * x[3]^2) / (1 + a[i] * x[4]^2) - b[i]) / b[i]
  )

  return MathOptNLSModel(nls, F, name = "tp351")
end
