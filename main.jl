module SudokuSolver

function fillRows(sudoku::Matrix{Int})
    old = zeros(Int, (9, 9))

    while old != sudoku
        old = copy(sudoku)

        # Rows and columns
        for i in 1:9
            sudoku[i, :] = fillMissingDigit(sudoku[i, :]) # Rows
            sudoku[:, i] = fillMissingDigit(sudoku[:, i]) # Columns
        end

        # Subsquares
        for i in [1, 4, 7, 28, 31, 34, 55, 58, 61] # These are all the indexes where a new subsquare starts
            indexes = [i, i + 9, i + 18, i + 1, i + 10, i + 19, i + 2, i + 11, i + 20] # These are all the indexes of a subsquare
            numbers = map(index -> sudoku[index], indexes) |> fillMissingDigit # Find the numbers and run `fillMissingDigit`

            for j in 1:9
                sudoku[indexes[j]] = numbers[j] # Fill the found digits in the sudoku
            end
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
