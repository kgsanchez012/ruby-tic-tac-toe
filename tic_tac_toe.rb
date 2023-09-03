class Player
    attr_reader :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end

class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(3) {Array.new(3, ' ')}
    end
    def display
        @grid.each { |row| puts row.join('|')}
        #self.board.each do |row|
            #row.each do |element|
              #print element.to_s + ' '
            #end
            #puts ''
        #end
    end
    def make_move(row, col, symbol)
        if @grid[row][col] == " "
            @grid[row][col] = symbol
            return True
        else
            return False
        end
    end       
end

class Game
    def initialize
        @board = Board.new
        @player1 = Player.new('Player 1', 'X')
        @player2 = Player.new('Player 2', 'X')
        @current_player = @player1
    end
    def switch_player
        @current_player = (@current_player == @player1) ? @player2 : @player1
    end
    def play
        puts 'Welcome to Tic-Tac-Toe!'
        @board.display

        until game_over?
            puts "#{@current_player.name}'s turn (#{@current_player.symbol}):"
            row, col = get_move
            if @board.place_symbol(row, col, @current_player.symbol)
                @board.display
                switch_player
            else
                puts 'Invalid move. Try again.'
            end
        end
        display_result
    end
    def game_over?
        #win/draw conditions
    end
    def display_result
        #game result (win/draw/continue)
    end
end

if __FILE__ == $tic_tac_toe.rb
    tic_tac_toe = Game.new
    tic_tac_toe.play
end