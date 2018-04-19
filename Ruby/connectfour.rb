# Ruby Assignment Code Skeleton
# Nigel Ward, University of Texas at El Paso
# April 2015
# borrowing liberally from Gregory Brown's tic-tac-toe game

#------------------------------------------------------------------
class Board
  def initialize
  @board = [[nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil] ]
  end

  # process a sequence of moves, each just a column number
  def addDiscs(firstPlayer, columns)
    if firstPlayer == :R
      players = [:R, :O].cycle
    else 
      players = [:O, :R].cycle
    end
    columns.each {|c| addDisc(players.next, c)}
  end 

  def addDisc(player, column)
    if column >= 7 || column < 0
      puts "  addDisc(#{player},#{column}): out of bounds"
      return false   
    end 
    firstFreeRow =  @board.transpose.slice(column).index(nil)
    if firstFreeRow == nil  
      puts "  addDisc(#{player},#{column}): column full already"
      return false 
    end
    update(firstFreeRow, column, player)
    return true
  end

  def update(row, col, player)
    @board[row][col] = player
  end

  def print
    puts @board.map {|row| row.map { |e| e || " "}.join("|")}.join("\n")
    puts "\n"
  end

  def hasWon? (player)
    return verticalWin?(player)| horizontalWin?(player) | 
           diagonalUpWin?(player)| diagonalDownWin?(player)
  end 

  def verticalWin? (player)
    (0..6).any? {|c| (0..2).any? {|r| fourFromTowards?(player, r, c, 1, 0)}}
  end

  def horizontalWin? (player)
    (0..3).any? {|c| (0..5).any? {|r| fourFromTowards?(player, r, c, 0, 1)}}
  end

  def diagonalUpWin? (player)
    (0..3).any? {|c| (0..2).any? {|r| fourFromTowards?(player, r, c, 1, 1)}}
  end

  def diagonalDownWin? (player)
    (0..3).any? {|c| (3..5).any? {|r| fourFromTowards?(player, r, c, -1, 1)}}
  end

  def fourFromTowards?(player, r, c, dx, dy)
    return (0..3).all?{|step| @board[r+step*dx][c+step*dy] == player}
  end

end # Board
#------------------------------------------------------------------

def robotMove(player, board)   # stub
  return 0          
  #return rand(7)   
end


#------------------------------------------------------------------
def testResult(testID, move, targets, intent)
  if targets.member?(move)
    puts("testResult: passed test #{testID}")
  else
    puts("testResult: failed test #{testID}: \n moved to #{move}, which wasn't one of #{targets}; \n failed #{intent}")
  end
end


#------------------------------------------------------------------
# test some robot-player behaviors
testboard1 = Board.new
testboard1.addDisc(:R,4)
testboard1.addDisc(:O,4)
testboard1.addDisc(:R,5)
testboard1.addDisc(:O,5)
testboard1.addDisc(:R,6)
testboard1.addDisc(:O,6)
testResult(:block1, robotMove(:R, testboard1),[3], 'robot should block horiz')
testboard1.print

testboard2 = Board.new
testboard2.addDiscs(:R, [3, 1, 3, 2, 3]);
testResult(:block2, robotMove(:O, testboard2), [3], 'robot should block vert')
testboard2.print

testboard2 = Board.new
testboard2.addDiscs(:O, [3, 1, 3, 2, 3, 4]);
testResult(:block2, robotMove(:O, testboard2), [3], 'robot should complete stack')
testboard2.print

testboard2 = Board.new
testboard2.addDiscs(:R, [3, 1, 4, 5, 2, 1, 6, 0, 3, 4, 5, 3, 2, 2, 6 ]);
testResult(:block2, robotMove(:O, testboard2), [3], 'robot should complete diag')
testboard2.print

testboard3 = Board.new
testboard3.addDiscs(:O, [1,1,2,2,3,3])
testResult(:avoid, robotMove(:O, testboard3), [0,6], 'robot should avoid giving win')
testboard3.print

