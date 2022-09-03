include("main.jl")
using Test, Random
using .SudokuSolver: fillMissingDigit

@testset verbose = true "Sudoku Solver" begin
    @testset "It can fill one missing digit" begin
        for i in 1:1000
            # It can fill when one digit is missing
            correct = shuffle(1:9)
            incorrect = replace(correct, rand(1:9) => 0)
            @test fillMissingDigit(incorrect) == correct

            # It stays the same when all digits are filled in
            correct = shuffle(1:9)
            @test fillMissingDigit(correct) == correct

            # It stays the same when two or more digits are missing
            correct = shuffle(1:9)
            incorrect = replace(replace(correct, rand(1:4) => 0), rand(5:9) => 0)
            @test fillMissingDigit(incorrect) == incorrect
        end
    end
end
