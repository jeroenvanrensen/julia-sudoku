include("main.jl")
using Test, Random
using .SudokuSolver: fillMissingDigit, fillRows

@testset verbose = true "Sudoku Solver" begin
    @testset "It can fill in one missing digit" begin
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

    @testset "It can fill in missing digits in columns, rows, and subsquares" begin
        sudoku = [
            0 3 6 2 0 9 7 4 8
            7 0 5 4 1 8 9 3 6
            4 0 0 3 6 7 1 5 0
            3 6 0 0 8 5 2 1 9
            5 1 8 0 9 2 0 7 4
            9 7 2 0 0 4 6 8 5
            2 4 1 5 0 0 8 9 3
            8 0 3 9 2 0 0 6 7
            6 9 7 8 4 3 0 2 0
        ]

        expected = [
            1 3 6 2 5 9 7 4 8
            7 2 5 4 1 8 9 3 6
            4 8 9 3 6 7 1 5 2
            3 6 4 7 8 5 2 1 9
            5 1 8 6 9 2 3 7 4
            9 7 2 1 3 4 6 8 5
            2 4 1 5 7 6 8 9 3
            8 5 3 9 2 1 4 6 7
            6 9 7 8 4 3 5 2 1
        ]

        @test fillRows(sudoku) == expected
    end
end
