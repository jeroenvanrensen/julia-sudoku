include("main.jl")
using Test, .SudokuSolver

@test solve() == 3
