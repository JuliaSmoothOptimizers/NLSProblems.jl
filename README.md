# NLSProblems - Nonlinear Least Squares problems

[![Build Status](https://travis-ci.org/JuliaSmoothOptimizers/NLSProblems.jl.svg?branch=master)](https://travis-ci.org/JuliaSmoothOptimizers/NLSProblems.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/gvkfw6sxf1p2qewt/branch/master?svg=true)](https://ci.appveyor.com/project/dpo/nlsproblems-jl/branch/master)


This package provides some optimization problems using the
[NLPModels.jl](https://github.com/JuliaSmoothOptimizers/NLPModels.jl)
interface. It is similar to to
[OptimizationProblems.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl),
except that it's specific for Nonlinear Least Squares, using the subtype
of `AbstractNLSModel`.

This collection currently contains the problems of Moré, Garbow and
Hillstrom [1].

We welcome contributions.

## Install

Simply issue

```
Pkg.clone("https://github.com/JuliaSmoothOptimizers/NLSProblems.jl")
```

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
