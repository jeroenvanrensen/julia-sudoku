module SudokuSolver

function fillMissingDigit(column::Vector)
    if filter(digit -> digit == 0, column) |> length != 1
        return column
    end

    missingDigit = filter(digit -> digit ∉ column, 1:9) |> first

    return replace(column, 0 => missingDigit)
end

end
