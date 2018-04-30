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
            insert(@player_move)
            @last_move = @player_move
            puts "V"
        elsif block_diagonal_right?
            insert(@player_move)
            @last_move = @player_move
            puts "DR"
        elsif block_horizontal_left?
            insert(@player_move)
            @last_move = @player_move
            puts "DL"
        elsif block_horizontal_right?
            insert(@player_move)
            @last_move = @player_move
            puts "HR"
        elsif block_horizontal_left?
            insert(@player_move)
            @last_move = @player_move
            puts "HL"
        elsif !@last_move.nil?
            insert(@last_move)
            puts "DEF1"
        elsif @last_move.nil?
            insert(@player_move)
            @last_move = @player_move
            puts "DEF2"
        end
    end

    def insert(position)
        if @board.is_full?(position)
            if @last_move != position && @board.is_full?(@last_move)
                @board.add_disc(:R, @last_move)
            else
                @last_move = (1 - @player_move) % 7
                @board.add_disc(:R, @last_move)
            end
        else
            @board.add_disc(:R, position)
        end
        @block_flag = false
    end

    def in_range(row, col)
        row < 6 && col < 7 && row >= 0 && col >= 0
    end

    def block_diagonal_right?
        indices = @board.get_column(@player_move)
        indices = indices.each_index.select {|e| indices[e] == :O}
        indices.each do |index|
            row = index + 1
            col = @player_move + 1
            if in_range(row + 1, col + 1)
                if @board.get_element(row, col) == :O && @board.get_element(row + 1, col + 1) == :O
                    return true
                else
                    return false
                end
            end
            return false
        end
    end

    def block_diagonal_left?
        indices = @board.get_column(@player_move)
        indices = indices.each_index.select {|e| indices[e] == :O}
        indices.each do |index|
            row = index + 1
            col = @player_move - 1
            if in_range(row + 1, col - 1)
                if @board.get_element(row, col) == :O && @board.get_element(row + 1, col - 1) == :O
                    return true
                else
                    return false
                end
            end
            return false
        end
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
                        @player_move = original_pos - 1
                    else
                        @player_move = s + 1
                    end
                elsif s == e && @board.get_element(index, s) == :O
                    @block_flag |= true
                    if @player_move + 1 < 7 && original_pos - 1 >= 0
                        @player_move = original_pos - 1
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
                if s != e && @board.get_element(index, s) == :O
                    @block_flag = true
                    if @player_move - 1 >= 0 && original_pos + 1 < 7
                        @player_move = original_pos + 1
                    else
                        @player_move = s - 1
                    end
                elsif s == e && @board.get_element(index, s) == :O
                    @block_flag |= true
                    if @player_move - 1 >= 0 && original_pos + 1 < 7
                        @player_move = original_pos + 1
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
            s = index + 1
            e = index + 2
            if s <= e && e < 6 && s < 6
                if @board.get_element(s, @player_move) == :O && @board.get_element(e, @player_move) == :O
                    return true
                else
                    return false
                end
            end
        end
        @block_flag
    end

end