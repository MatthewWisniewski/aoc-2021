function day_3_part_2(data :: Vector{String})
    oxygenReading = parseForOxygenReading(data)
    scrubberReading = parseForScrubberReading(data)

    return parse(Int, oxygenReading; base=2) * parse(Int, scrubberReading; base=2)

end

function parseForOxygenReading(data) 
    candidates = Vector{Bool}(undef, length(data))

    for i in range(1, length(candidates))
        candidates[i] = true
    end 

    prefix = ""

    for i in range(1, length(data[1]))
        prefix *= getNextMostCommonBitOnRemainingReadings(data, candidates, prefix)

        for j in range(1, length(data))
            if candidates[j] && startswith(data[j], prefix) == false
                candidates[j] = false
            end 
        end

        if countRemainingCandidates(candidates) == 1
            break
        end
    end

    for (status, reading) in zip(candidates, data)
        if status == 1
            return reading
        end
    end
end

function parseForScrubberReading(data) 
    candidates = Vector{Bool}(undef, length(data))

    for i in range(1, length(candidates))
        candidates[i] = true
    end 

    prefix = ""

    for i in range(1, length(data[1]))
        nextBit = getNextMostCommonBitOnRemainingReadings(data, candidates, prefix)

        prefix *= nextBit == "0" ? "1" : "0"

        for j in range(1, length(data))
            if candidates[j] && startswith(data[j], prefix) == false
                candidates[j] = false
            end 
        end

        if countRemainingCandidates(candidates) == 1
            break
        end
    end

    for (status, reading) in zip(candidates, data)
        if status == 1
            return reading
        end
    end
end

function getNextMostCommonBitOnRemainingReadings(data, validOptions, prefix)
    num_zeroes = 0
    num_ones = 0

    for i in range(1, length(validOptions))
        if validOptions[i] == false
            continue
        end
        if startswith(data[i], prefix * "0")
            num_zeroes += 1
        else 
            num_ones += 1
        end
    end

    return num_ones >= num_zeroes ? "1" : "0" 
end

function countRemainingCandidates(candidates)
    return sum(map(x -> x ? 1 : 0, candidates))
end

lines = readlines(open("day 3 input.txt"))
println(day_3_part_2(lines))