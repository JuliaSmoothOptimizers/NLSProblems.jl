# MGH problem 10 - Meyer function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh10

"Freudstein and Roth function"
function mgh10()

  y = [34780; 28610; 23650; 19630; 16370; 13720; 11540; 9744; 8261; 7030; 6005;
       5147; 4427; 3820; 3307; 2872]
  F(x) = [x[1] * exp(x[2]/(45 + 5i + x[3])) - y[i] for i = 1:16]
  x0 = [0.02; 4000; 250]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 16, name="mgh10")
end
