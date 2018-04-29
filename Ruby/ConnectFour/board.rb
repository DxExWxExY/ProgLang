# Ruby Assignment Code Skeleton
# Nigel Ward, University of Texas at El Paso
# April 2015
# borrowing liberally from Gregory Brown's tic-tac-toe game

class Board
  def initialize
    @board = [[nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil]]
  end

  def add_discs(first_player, columns)
    players = if first_player == :R
                %i[R O].cycle
              else
                %i[O R].cycle
              end
    columns.each { |c| add_disc(players.next, c) }
  end

  def add_disc(player, column)
    if column >= 7 || column < 0
      puts "  add_disc(#{player},#{column}): out of bounds"
      return false
    end


    first_free_row = @board.transpose.slice(column).rindex(nil)

    if first_free_row.nil?
      puts "  add_disc(#{player},#{column}): column full already"
      return false
    end
    update(first_free_row, column, player)
    true
  end

  def update(row, col, player)
    @board[row][col] = player
  end

  def get_element(row, col)
    @board[row][col]
  end

  def get_column(col)
    @board.transpose.slice(col)
  end

  def print
    puts @board.map { |row| row.map { |e| e || ' ' }.join('|') }.join("\n")
    puts "1 2 3 4 5 6 7\n"
  end

  def has_won?(player)
    vertical_win?(player) | horizontal_win?(player) |
        diagonal_up_win?(player) | diagonal_down_win?(player)
  end

  def vertical_win?(player)
    (0..6).any? { |c| (0..2).any? { |r| four_from_towards?(player, r, c, 1, 0) } }
  end

  def horizontal_win?(player)
    (0..3).any? { |c| (0..5).any? { |r| four_from_towards?(player, r, c, 0, 1) } }
  end

  def diagonal_up_win?(player)
    (0..3).any? { |c| (0..2).any? { |r| four_from_towards?(player, r, c, 1, 1) } }
  end

  def diagonal_down_win?(player)
    (0..3).any? { |c| (3..5).any? { |r| four_from_towards?(player, r, c, -1, 1) } }
  end

  def four_from_towards?(player, r, c, dx, dy)
    (0..3).all? { |step| @board[r + step * dx][c + step * dy] == player }
  end

end