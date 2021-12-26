function productOfPathDestination(instructions :: Vector{String})

    x_coord = 0
    y_coord = 0

    for instruction in instructions
        command, amount = split(instruction, " ")
        amount = parse(Int, amount)
        if command == "forward"
            x_coord += amount
        elseif command == "up"
            y_coord -= amount
        elseif command == "down"
            y_coord += amount
        end
    end

    return x_coord * y_coord
end

lines = readlines(open("day 2 input.txt"))

println(productOfPathDestination(lines))