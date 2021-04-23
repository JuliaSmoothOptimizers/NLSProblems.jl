# TP problem 379 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp379

"Test problem 379 in NLS format"
function tp379(args...)
  nls = Model()
  x0 = [1.3; 0.65; 0.65; 0.7; 0.6; 3.0; 5.0; 7.0; 2.0; 4.5; 5.5]
  @variable(nls, x[i = 1:11], start = x0[i])

  t = [0.1 * (i - 1) for i = 1:65]
  y = [
    1.366
    1.191
    1.112
    1.013
    0.991
    0.885
    0.831
    0.847
    0.786
    0.725
    0.746
    0.679
    0.608
    0.655
    0.616
    0.606
    0.602
    0.626
    0.651
    0.724
    0.649
    0.649
    0.694
    0.644
    0.624
    0.661
    0.612
    0.558
    0.533
    0.495
    0.500
    0.423
    0.395
    0.375
    0.372
    0.391
    0.396
    0.405
    0.428
    0.429
    0.523
    0.562
    0.607
    0.653
    0.672
    0.708
    0.633
    0.668
    0.645
    0.632
    0.591
    0.559
    0.597
    0.625
    0.739
    0.710
    0.729
    0.720
    0.636
    0.581
    0.428
    0.292
    0.162
    0.098
    0.054
  ]
  @NLexpression(
    nls,
    F[i = 1:65],
    y[i] - x[1] * exp(-x[5] * t[i]) - x[2] * exp(-x[6] * (t[i] - x[9])^2) -
    x[3] * exp(-x[7] * (t[i] - x[10])^2) - x[4] * exp(-x[8] * (t[i] - x[11])^2)
  )

  return MathOptNLSModel(nls, F, name = "tp379")
end
