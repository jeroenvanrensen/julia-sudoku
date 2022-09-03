include("main.jl")
using Test, Random
using .SudokuSolver: fillMissingDigit

for i in 1:1000
    # it fills when one digit is empty
    correct = shuffle(1:9)
    incorrect = replace(correct, rand(1:9) => 0)
    @test fillMissingDigit(incorrect) == correct

    # it keeps the same when all digits are filled
    correct = shuffle(1:9)
    @test fillMissingDigit(correct) == correct

    # it does not fill in when two or more digits are missing
    correct = shuffle(1:9)
    incorrect = replace(replace(correct, rand(1:4) => 0), rand(5:9) => 0)
    @test fillMissingDigit(incorrect) == incorrect
end

println("✅ Tests passed")
