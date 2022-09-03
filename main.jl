module SudokuSolver

function fillRows(sudoku::Matrix{Int})
    old = zeros(Int, (9, 9))

    while old != sudoku
        old = copy(sudoku)

        for i in 1:9
            sudoku[i, :] = fillMissingDigit(sudoku[i, :]) # Rows
            sudoku[:, i] = fillMissingDigit(sudoku[:, i]) # Columns
        end
    end

    return sudoku
end

function fillMissingDigit(column::Vector)
    if filter(digit -> digit == 0, column) |> length != 1
        return column
    end

    missingDigit = filter(digit -> digit ∉ column, 1:9) |> first

    return replace(column, 0 => missingDigit)
end

end
