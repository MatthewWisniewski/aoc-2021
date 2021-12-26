function productOfPathDestination(instructions :: Vector{String})

    horizontal_pos = 0
    depth = 0
    aim = 0

    for instruction in instructions
        command, amount = split(instruction, " ")
        amount = parse(Int, amount)
        if command == "forward"
            horizontal_pos += amount
            depth += amount * aim
        elseif command == "up"
            aim -= amount
        elseif command == "down"
            aim += amount
        end
    end

    return horizontal_pos * depth
end

lines = readlines(open("day 2 input.txt"))

println(productOfPathDestination(lines))