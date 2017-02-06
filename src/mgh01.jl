# MGH problem 1 - Rosenbrock function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh01, nls_rosenbrock

"Rosenbrock problem in Nonlinear Least Squares form"
function mgh01()

  F(x) = [10*(x[2] - x[1]^2);
          1 - x[1]]
  x0 = [-1.2; 1.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 2)
end

@doc (@doc mgh01)
nls_rosenbrock() = mgh01()
