# TP problem 266 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp266

"Test problem 266 in NLS format"
function tp266(args...)
  nls = Model()
  @variable(nls, x[i = 1:5], start = 0.1)

  A = [
    0.0426149
    0.0352053
    0.0878058
    0.0330812
    0.0580924
    0.649704
    0.344144
    -0.627443
    0.001828
    -0.224783
  ]
  D =
    [2.34659; 2.84048; 1.12888; 3.02286; 1.72139; 0.153917; 0.290577; -0.159378; 54.6910; -0.444873]
  C = [
    -0.564255 0.392417 -0.404979 0.927589 -0.0735084
    0.535493 0.658799 -0.636666 -0.681091 -0.869487
    0.586387 0.289826 0.854402 0.789312 0.949721
    0.608734 0.984915 0.375699 0.239547 0.463136
    0.774227 0.325421 -0.151719 0.448051 0.149926
    -0.435033 -0.688583 0.222278 -0.524653 0.413248
    0.759468 -0.627795 0.0403142 0.724666 -0.0182537
    -0.152448 -0.546437 0.484134 0.353951 0.887866
    -0.821772 -0.53412 -0.798498 -0.658572 0.662362
    0.819831 -0.910632 -0.480344 -0.871758 -0.978666
  ]
  B = [
    0.354033 -0.0230349 -0.211938 -0.0554288 0.220429
    -0.0230349 0.29135 -0.00180333 -0.111141 0.0485461
    -0.211938 -0.00180333 0.815808 -0.133538 -0.38067
    -0.0554288 -0.111141 -0.133538 0.389198 -0.131586
    0.220429 0.0485461 -0.38067 -0.131586 0.534706
  ]

  # F = A + cx + ½(xᵀBx)D
  @NLexpression(
    nls,
    F[k = 1:10],
    A[k] +
    sum(x[i] * C[k, i] for i = 1:5) +
    0.5 * D[k] * sum(B[i, j] * x[i] * x[j] for i = 1:5, j = 1:5)
  )

  return MathOptNLSModel(nls, F, name = "tp266")
end
