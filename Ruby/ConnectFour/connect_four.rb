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

def play()
  puts "Welcome to ConnectFour"
  print "Select Mode: PvE (1) PvP (2): "
  mode = gets.to_i
  if mode == 1
    single_player
  elsif mode == 2
    multi_player
  elsif mode == 3
    test
  else
    puts "Invalid Option, Try again."
    play
  end
end

def single_player()
  game = Board.new
  ai = Robot.new(game)
  until game.has_won?(:O) || game.has_won?(:R)
    game.print
    print "Select Column to Insert (1 - 7): "
    col = gets.to_i - 1
    if col < 7 && col >= 0
      game.add_disc(:O, col)
      ai.block(col)
    else
      puts "Invalid Column, Try Again!"
    end
  end
  if game.has_won?(:O)
    puts "You won to a semi-functional AI, so whatever..."
  elsif game.has_won?(:R)
    puts "You lost to a semi-functional AI, shame on you..."
  end

end

def multi_player()
  game = Board.new
  player = [:X, :O]
  turn = 0
  until game.has_won?(:X) || game.has_won?(:O)
    game.print
    puts "Player "+player[turn].to_s+"'s Turn!"
    print "Select Column to Insert (1 - 7): "
    col = gets.to_i - 1
    if col < 7 && col >= 0
      game.add_disc(player[turn], col)
    else
      puts "Invalid Column, Try Again!"
    end
    turn = (turn + 1) % 2
  end
  if game.has_won?(:X)
    puts "Player X Wins!"
  elsif game.has_won?(:O)
    puts "Player O Wins!"
  end
end

# Psychological Main
play
