depths = readlines(open("1-1 input.txt"))

depths = map(x -> parse(Int, x), depths)

function getTimesDepthIncreases(n::Vector{Int})
    timesDepthIncreases = 0

    for i in range(2, length(n))
        if n[i - 1] < n[i]
            timesDepthIncreases +=1
        end 
    end
    return timesDepthIncreases
end

depths = readlines(open("day 1 input.txt"))

println(getTimesDepthIncreases(depths))