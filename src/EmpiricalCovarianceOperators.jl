module EmpiricalCovarianceOperators
    using LowRankApprox: AbstractLinearOperator, LinearOperator, pheigfact, PartialHermitianEigen
    import Base: convert, size, transpose
    using Nullables
    import LinearAlgebra
    using LinearAlgebra: UniformScaling, I, Diagonal
    using Statistics: mean

    include("covarianceoperator.jl")
    include("utilities.jl")

    export CovarianceOperator, CrossCovarianceOperator
    export covmul!, crosscovmul!
    export wbinv
    
end # module
