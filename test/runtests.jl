module EmpiricalCovarianceOperatorsTests
    using EmpiricalCovarianceOperators
    using Test
    using Random
    using Statistics

    @testset "CovarianceOperator Tests" begin
        x = randn(500)
        X = randn(20,500)
        C = cov(X,X)
        A = CovarianceOperator(X)
        y = C*x
        Y = randn(20,300)
        A2 = CrossCovarianceOperator(X,Y)
        C2 = cov(X,Y)
        x2 = randn(300)
        y2 = C2*x2
        y1p5 = C2'*x
        @test isapprox(C, convert(Array{Float64}, A))
        @test isapprox(y, A*x)
        @test isapprox(convert(Array{Float64}, A), convert(Array{Float64}, A'))
        @test_broken isapprox(C2, convert(Array{Float64}, A2))
        @test isapprox(y2, A2*x2)
        @test isapprox(y1p5, A2'*x)
        @test_broken isapprox(x'*B*x2, x2'*B'*x)
    end
end