function day_3_part_1(data :: Vector{String})

    counts = Vector{Int}(undef, length(data[1]))

    for reading in data
        for i in range(1, length(reading))
            counts[i] += parse(Int, reading[i])
        end
    end

    gammaValues = Vector{Int}(undef, length(counts))
    epsilonValues = Vector{Int}(undef, length(counts))

    for i in range(1, length(counts))
        if counts[i] * 2 >= length(data)
            gammaValues[i] = 1
            epsilonValues[i] = 0
        else
            gammaValues[i] = 0
            epsilonValues[i] = 1
        end
    end

    gamma = binaryArrayToInt(gammaValues)
    epsilon = binaryArrayToInt(epsilonValues)
    return gamma * epsilon

end

function binaryArrayToInt(arr)
    total = 0
    for i in range(1, length(arr))
        if arr[i] == 0
            continue
        else
            total += 2 ^ (length(arr) - i)
        end
    end
    return total
end

lines = readlines(open("day 3 input.txt"))
println(day_3_part_1(lines))