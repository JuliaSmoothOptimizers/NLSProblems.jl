# NLSProblems.jl

This package provides Nonlinear Least Squares optimization problems in [NLPModels.jl](https://github.com/JuliaSmoothOptimizers/NLPModels.jl)
 interface using [JuMP](https://github.com/JuliaOpt/JuMP.jl) syntax and [NLPModelsJuMP](https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl).
It is similar to 
[OptimizationProblems.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl),
except that it's specific for nonlinear least squares, using the subtype of `AbstractNLSModel`.

This collection currently contains the problems of Moré, Garbow and
Hillstrom [1].

## Install

NLSProblems can be installed and tested through the Julia package manager:

```julia
julia> ]
pkg> add NLSProblems
pkg> test NLSProblems
```

## Contributing

Please open pull requests to submit new problems! When submitting a problem,
please pay particular attention to the documentation. We would like to gather
as much information as possible on the provenance of problems.

## How to cite

If you use NLSProblems.jl in your work, please cite using the format given in [CITATION.bib](CITATION.bib).

## References

[1] J. J. Moré, B. S. Garbow and K. E. Hillstrom.
*Testing Unconstrained Optimization Software*.
ACM Transactions on Mathematical Software, 7(1):17-41, 1981.
[10.1145/355934.355936](https://doi.org/10.1145/355934.355936)

[2] W. Hock and K. Schittkowski.
*Test examples for nonlinear programming codes*.
Lecture Notes in Economics and Mathematical Systems 187,
Springer Verlag Berlin Heidelberg, 1981.
[10.1007/978-3-642-48320-2](https://doi.org/10.1007/978-3-642-48320-2)

[3] L. Lukšan and J. Vlček.
*Sparse and Partially Separable Test Problems for Unconstrained and
Equality Constrained Optimization*.
[Technical report 767, 1999](http://hdl.handle.net/11104/0123965)

[4] K. Schittkowski.
*More test examples for nonlinear programming codes*.
Lecture Notes in Economics and Mathematical Systems 282,
Springer Verlag Berlin Heidelberg, 1987.
[10.1007/978-3-642-61582-5](https://doi.org/10.1007/978-3-642-61582-5)
