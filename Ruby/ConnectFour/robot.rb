load 'board.rb'

class Robot

  @player_move = nil
  @last_move = nil
  @board = nil
  @block_flag = false

  def initialize(game)
    @board = game
  end

  def block(move)
    @player_move = move
    if block_vertical?
      @board.add_disc(:R, @player_move)
      @block_flag = false
      puts "Blocked Vertically"
    elsif block_horizontal_right?
      @board.add_disc(:R, @player_move)
      @block_flag = false
      puts "Blocked Horizontally R"
      @last_move = @player_move
    elsif block_horizontal_left?
      @board.add_disc(:R, @player_move)
      @block_flag = false
      puts "Blocked Horizontally L"
      @last_move = @player_move
    elsif !@last_move.nil?
      @board.add_disc(:R, @last_move)
      @block_flag = false
    elsif @last_move.nil?
      @board.add_disc(:R, @player_move)
      @last_move = @player_move
      @block_flag = false
    end
  end

  def block_diagonal?

  end

  def block_horizontal_right?
    original_pos = @player_move
    indices = @board.get_column(@player_move)
    indices = indices.each_index.select {|e| indices[e] == :O}
    indices.each do |index|
      s = @player_move + 1
      e = @player_move + 3
      while s <= e && s < 7 && s >= 0
        if s != e && @board.get_element(index, s) == :O
          @block_flag = true
          if @player_move + 1 < 7 && original_pos - 1 >= 0
            @player_move =  original_pos - 1
          else
            @player_move = s + 1
          end
        elsif s == e && @board.get_element(index, s) == :O
          @block_flag |= true
          if @player_move + 1 < 7 && original_pos - 1 >= 0
            @player_move =  original_pos - 1
          else
            @player_move = s + 1
          end
        else
          return @block_flag
        end
        s += 1
      end
    end
    @block_flag
  end

  def block_horizontal_left?
    original_pos = @player_move
    indices = @board.get_column(@player_move)
    indices = indices.each_index.select {|e| indices[e] == :O}
    indices.each do |index|
      s = @player_move - 1
      e = @player_move - 2
      while s >= e && s < 7 && s >= 0
        puts "S: " + s.to_s
        if s != e && @board.get_element(index, s) == :O
          @block_flag = true
          if @player_move - 1 >= 0 && original_pos + 1 < 7
            @player_move =  original_pos + 1
          else
            @player_move = s - 1
          end
        elsif s == e && @board.get_element(index, s) == :O
          @block_flag |= true
          if @player_move - 1 >= 0 && original_pos + 1 < 7
            @player_move =  original_pos + 1
          else
            @player_move = s - 1
          end
        else
          return @block_flag
        end
        s -= 1
      end
    end
    @block_flag
  end

  def block_vertical?
    indices = @board.get_column(@player_move)
    indices = indices.each_index.select {|e| indices[e] == :O}
    indices.each do |index|
      s = index - 1
      e = index - 2
      while s <= e && s < 6 && s >= 0
        if s != e
          @block_flag &= @board.get_element(@player_move, s) == :O
        else
          @block_flag |= @board.get_element(@player_move, s) == :O
        end
        s -= 1
      end
    end
    @block_flag
  end

end