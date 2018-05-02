load 'board.rb'
load 'robot.rb'

def test
    test1 = Board.new
    test1.add_disc(:R, 4)
    test1.add_disc(:O, 4)
    test1.add_disc(:R, 5)
    test1.add_disc(:O, 5)
    test1.add_disc(:R, 6)
    test1.add_disc(:O, 6)
    test_result(:block1, robot_move(:R, test1), [3], 'robot should block horiz')
    test1.print

    test2 = Board.new
    test2.add_discs(:R, [3, 1, 3, 2, 3])
    test_result(:block2, robot_move(:O, test2), [3], 'robot should block vert')
    test2.print

    test2 = Board.new
    test2.add_discs(:O, [3, 1, 3, 2, 3, 4])
    test_result(:block2, robot_move(:O, test2), [3], 'robot should complete stack')
    test2.print

    test2 = Board.new
    test2.add_discs(:R, [3, 1, 4, 5, 2, 1, 6, 0, 3, 4, 5, 3, 2, 2, 6])
    test_result(:block2, robot_move(:O, test2), [3], 'robot should complete diag')
    test2.print

    test3 = Board.new
    test3.add_discs(:O, [1, 1, 2, 2, 3, 3])
    test_result(:avoid, robot_move(:O, test3), [0, 6], 'robot should avoid giving win')
    test3.print
end

def robot_move(_player, _board) # stub
    rand(6)
end

def test_result(test_id, move, targets, intent)
    if targets.member?(move)
        puts("test_result: passed test #{test_id}")
    else
        puts("test_result: failed test #{test_id}: \n moved to #{move}, which wasn't one of #{targets}; \n failed #{intent}")
    end
end

def single_player_window
    Shoes.app(title: "Single Player", width: 750, height: 550, resizable: false) {
        # Some variables
        size = 50
        game = Board.new
        ai = Robot.new(game)
        background darkblue

        @a1 = button "Add in 1"
        @a2 = button "Add in 2"
        @a3 = button "Add in 3"
        @a4 = button "Add in 4"
        @a5 = button "Add in 5"
        @a6 = button "Add in 6"
        @a7 = button "Add in 7"

        @a1.style(:margin_left => 10, :margin_top => 450)
        @a2.style(:margin_left => 10, :margin_top => 450)
        @a3.style(:margin_left => 10, :margin_top => 450)
        @a4.style(:margin_left => 10, :margin_top => 450)
        @a5.style(:margin_left => 10, :margin_top => 450)
        @a6.style(:margin_left => 10, :margin_top => 450)
        @a7.style(:margin_left => 10, :margin_top => 450)

        @a1.click {game.add_disc(:O, 0) && ai.block(0)}
        @a2.click {game.add_disc(:O, 1) && ai.block(1)}
        @a3.click {game.add_disc(:O, 2) && ai.block(2)}
        @a4.click {game.add_disc(:O, 3) && ai.block(3)}
        @a5.click {game.add_disc(:O, 4) && ai.block(4)}
        @a6.click {game.add_disc(:O, 5) && ai.block(5)}
        @a7.click {game.add_disc(:O, 6) && ai.block(6)}

        @d1 = button "Pop at 1"
        @d2 = button "Pop at 2"
        @d3 = button "Pop at 3"
        @d4 = button "Pop at 4"
        @d5 = button "Pop at 5"
        @d6 = button "Pop at 6"
        @d7 = button "Pop at 7"

        @d1.style(:margin_left => 10, :margin_top => 20)
        @d2.style(:margin_left => 10, :margin_top => 20)
        @d3.style(:margin_left => 10, :margin_top => 20)
        @d4.style(:margin_left => 10, :margin_top => 20)
        @d5.style(:margin_left => 10, :margin_top => 20)
        @d6.style(:margin_left => 10, :margin_top => 20)
        @d7.style(:margin_left => 10, :margin_top => 20)


        @d1.click {game.pop_disc(0)}
        @d2.click {game.pop_disc(1)}
        @d3.click {game.pop_disc(2)}
        @d4.click {game.pop_disc(3)}
        @d5.click {game.pop_disc(4)}
        @d6.click {game.pop_disc(5)}
        @d7.click {game.pop_disc(6)}

        animate do
            i = 0
            while i < 6
                j = 0
                while j < 7
                    row = i * size + i * 20 + 10
                    col = j * size + j * 45 + 60
                    if game.get_element(i, j) == nil
                        fill gray
                        oval top: row, left: col, radius: 25
                    elsif game.get_element(i, j) == :R
                        fill red
                        oval top: row, left: col, radius: 25
                    elsif game.get_element(i, j) == :O
                        fill yellow
                        oval top: row, left: col, radius: 25
                    end
                    j += 1
                end
                i += 1
            end
            if game.has_won?(:O) || game.has_won?(:R)
                if game.has_won?(:O)
                    alert "You won to a semi-functional AI, so whatever..."
                    game = Board.new
                elsif game.has_won?(:R)
                    alert "You lost to a semi-functional AI, shame on you..."
                    game = Board.new
                end
            end
        end
    }
end

def multi_player_window
    Shoes.app(title: "Multiplayer", width: 750, height: 600, resizable: false) {
        # Some variables
        size = 50
        game = Board.new
        background darkblue

        @r1 = button "Red in 1"
        @r2 = button "Red in 2"
        @r3 = button "Red in 3"
        @r4 = button "Red in 4"
        @r5 = button "Red in 5"
        @r6 = button "Red in 6"
        @r7 = button "Red in 7"

        @r1.style(:margin_left => 10, :margin_top => 450)
        @r2.style(:margin_left => 10, :margin_top => 450)
        @r3.style(:margin_left => 10, :margin_top => 450)
        @r4.style(:margin_left => 10, :margin_top => 450)
        @r5.style(:margin_left => 10, :margin_top => 450)
        @r6.style(:margin_left => 10, :margin_top => 450)
        @r7.style(:margin_left => 10, :margin_top => 450)

        @r1.click {game.add_disc(:X, 0)}
        @r2.click {game.add_disc(:X, 1)}
        @r3.click {game.add_disc(:X, 2)}
        @r4.click {game.add_disc(:X, 3)}
        @r5.click {game.add_disc(:X, 4)}
        @r6.click {game.add_disc(:X, 5)}
        @r7.click {game.add_disc(:X, 6)}

        @y1 = button "Ylw in 1"
        @y2 = button "Ylw in 2"
        @y3 = button "Ylw in 3"
        @y4 = button "Ylw in 4"
        @y5 = button "Ylw in 5"
        @y6 = button "Ylw in 6"
        @y7 = button "Ylw in 7"

        @y1.style(:margin_left => 10, :margin_top => 20)
        @y2.style(:margin_left => 10, :margin_top => 20)
        @y3.style(:margin_left => 10, :margin_top => 20)
        @y4.style(:margin_left => 10, :margin_top => 20)
        @y5.style(:margin_left => 10, :margin_top => 20)
        @y6.style(:margin_left => 10, :margin_top => 20)
        @y7.style(:margin_left => 10, :margin_top => 20)

        @y1.click {game.add_disc(:O, 0)}
        @y2.click {game.add_disc(:O, 1)}
        @y3.click {game.add_disc(:O, 2)}
        @y4.click {game.add_disc(:O, 3)}
        @y5.click {game.add_disc(:O, 4)}
        @y6.click {game.add_disc(:O, 5)}
        @y7.click {game.add_disc(:O, 6)}

        @d1 = button "Pop at 1"
        @d2 = button "Pop at 2"
        @d3 = button "Pop at 3"
        @d4 = button "Pop at 4"
        @d5 = button "Pop at 5"
        @d6 = button "Pop at 6"
        @d7 = button "Pop at 7"

        @d1.style(:margin_left => 10, :margin_top => 20)
        @d2.style(:margin_left => 10, :margin_top => 20)
        @d3.style(:margin_left => 10, :margin_top => 20)
        @d4.style(:margin_left => 10, :margin_top => 20)
        @d5.style(:margin_left => 10, :margin_top => 20)
        @d6.style(:margin_left => 10, :margin_top => 20)
        @d7.style(:margin_left => 10, :margin_top => 20)


        @d1.click {game.pop_disc(0)}
        @d2.click {game.pop_disc(1)}
        @d3.click {game.pop_disc(2)}
        @d4.click {game.pop_disc(3)}
        @d5.click {game.pop_disc(4)}
        @d6.click {game.pop_disc(5)}
        @d7.click {game.pop_disc(6)}

        animate do
            i = 0
            while i < 6
                j = 0
                while j < 7
                    row = i * size + i * 20 + 10
                    col = j * size + j * 45 + 60
                    if game.get_element(i, j) == nil
                        fill gray
                        oval top: row, left: col, radius: 25
                    elsif game.get_element(i, j) == :X
                        fill red
                        oval top: row, left: col, radius: 25
                    elsif game.get_element(i, j) == :O
                        fill yellow
                        oval top: row, left: col, radius: 25
                    end
                    j += 1
                end
                i += 1
            end
            if game.has_won?(:X) || game.has_won?(:O)
                if game.has_won?(:O)
                    alert "Player Yellow Wins!"
                    game = Board.new
                elsif game.has_won?(:X)
                    alert "Player Red Wins!"
                    game = Board.new
                end
            end
        end
    }
end

# Psychological Main
Shoes.app(title: "ConnectFour", width: 350, height: 100, resizable: false) {
    background darkblue
    flow width: 350, height: 100 do
        flow width: 1.0, height: 0.3 do
            @intro = para "ConnectFour"
            @intro.align = "center"
            @intro.stroke = white 
            @intro.style(:margin_top => 10)
        end
        flow width: 1.0, height: 0.7 do
            @single = button "Single Player"
            @multi = button "Multiplayer"
            @single.style(:margin_left => 30, :margin_top => 10)
            @multi.style(:margin_left => 30, :margin_top => 10)
            @single.click {single_player_window}
            @multi.click {multi_player_window} 
        end
    end
}
