mutable struct BingoBoard
    board :: Vector{Vector{Int}}
    markedBoard :: Vector{Vector{Bool}}
end

function markBoardIfNumberPresent!(board :: BingoBoard, n :: Int)
    for row in range(1, length(board.board))
        for col in range(1, length(board.board[1]))
            if board.board[row][col] == n
                board.markedBoard[row][col] = true
            end
        end
    end
end

function hasBingoed(board :: BingoBoard)

    # Check if any rows are complete
    for row in range(1, length(board.markedBoard))
        bingo = true
        for col in range(1, length(board.markedBoard[1]))
            if board.markedBoard[row][col] == false
                bingo = false
                break
            end
        end
        if bingo
            return true
        end
    end

    # Check if any columns are complete
    for col in range(1, length(board.markedBoard[1]))
        bingo = true
        for row in range(1, length(board.markedBoard))
            if board.markedBoard[row][col] == false
                bingo = false
                break
            end
        end
        if bingo
            return true
        end
    end
    return false
end

function sumUnmarkedValues(board :: BingoBoard)
    total = 0
    for row in range(1, length(board.board))
        for col in range(1, length(board.board[1]))
            if board.markedBoard[row][col] == false
                total += board.board[row][col]
            end
        end
    end
    return total
end

function day_4_part_1(boards :: Vector{BingoBoard}, numbersCalled :: Vector{Int})
    for number in numbersCalled
        for board in boards
            markBoardIfNumberPresent!(board, number)
            if (hasBingoed(board))
                return sumUnmarkedValues(board) * number
            end
        end
    end
end

## MAIN PROGRAM

lines = readlines(open("day 4 input.txt"))

numbersCalled = map(x -> parse(Int, x), split(lines[2], ","))
boards = Vector{BingoBoard}()


for lineNo in range(4, length(lines)-6, step=6)
    gameBoard = Vector{Vector{Int}}(undef, 5)
    for i in range(0, 4)
        gameBoard[i + 1] = map(x-> parse(Int, x), split(lines[lineNo + i]))
    end

    markedBoard = Vector{Vector{Bool}}(undef, 5)
    for i in range(1, 5)
        markedBoard[i] = Vector{Bool}(undef, 5)
        for j in range(1, length(5))
            markedBoard[i][j] = false
        end
    end

    push!(boards, BingoBoard(gameBoard, markedBoard))
end


println(day_4_part_1(boards, numbersCalled))