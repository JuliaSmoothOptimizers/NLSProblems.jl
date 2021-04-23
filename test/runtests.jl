using NLPModels, NLSProblems, Test, Printf, LinearAlgebra

@printf(
  "%-15s  %4s  %4s  %4s  %10s  %10s  %10s\n",
  "Problem",
  "nequ",
  "nvar",
  "ncon",
  "‖F(x₀)‖²",
  "‖JᵀF‖",
  "‖c(x₀)‖"
)
# Test that every problem can be instantiated.
for prob in names(NLSProblems)
  prob == :NLSProblems && continue
  prob_fn = eval(prob)
  nls = prob_fn()
  N = nls.nls_meta.nequ
  n = nls.meta.nvar
  m = nls.meta.ncon
  x = nls.meta.x0
  Fx = residual(nls, x)
  Jx = jac_op_residual(nls, x)
  nFx = dot(Fx, Fx)
  JtF = norm(Jx' * Fx)
  ncx = m > 0 ? @sprintf("%10.4e", norm(cons(nls, x))) : "NA"
  @printf("%-15s  %4d  %4d  %4d  %10.4e  %10.4e  %10s\n", prob, N, n, m, nFx, JtF, ncx)

  # Test that every problem can be instantiated with arguments.
  nls2 = prob_fn(nls.meta.nvar)
end
