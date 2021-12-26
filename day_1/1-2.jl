function computeRollingAverageSize3(n)
    rollingAverage = Vector{Float64}(undef, length(n) - 2)
    for i in range(2, length(n) - 1)
        rollingAverage[i-1] = n[i-1] + n[i] + n[i+1]
    end
    println(rollingAverage[1])
    return rollingAverage
end

function getTimesDepthIncreases(n::Vector{Float64})
    timesDepthIncreases = 0

    for i in range(2, length(n))
        if n[i - 1] < n[i]
            timesDepthIncreases +=1
        end 
    end
    return timesDepthIncreases
end

depths = readlines(open("day 1 input.txt"))

depths = map(x -> parse(Int, x), depths)

println(depths[2])

println(getTimesDepthIncreases(computeRollingAverageSize3(depths)))