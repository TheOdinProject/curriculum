require 'pry-byebug'
class Game
  @@winner = ''
  @@turn_count = 1
  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
  end

  def play_game
    @board = Array.new(3) { Array.new(3, '_') }
    until @@turn_count == 11 do
      turn_count
      show_board
      set_cordinates
      check_winner
      @@turn_count += 1
    end
    show_board
    puts "the match is draw" unless @board.flatten.include?("_")
      # binding.pry
    puts "the winner is #{@@winner}" if @@winner
  end

  def show_board
    puts "\r"
    puts "----This is your battle field----\n\n"
    puts "#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    puts '---------'
    puts "#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    puts '---------'
    puts "#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end

  def turn_count
    player_choice(@@turn_count)
  end

  def player_choice(turn_count) 
    if turn_count.odd?
      @player_mark = "0"
      puts "#{@player1}'s turn."
    elsif turn_count.even?
      @player_mark = "X"
      puts "#{@player2}'s turn."
    end
  end

  def set_cordinates
    puts "enter your cordinates seperated by space like 0 0"
    cordinates = gets.chomp
    check_cordinates(cordinates)
  end

  def check_cordinates(cordinates)
  	cords_array = cordinates.split
    cord_1 = cords_array[0].to_i
    cord_2 = cords_array[1].to_i
    until cordinates.match(/\s/) && cord_1.between?(0, 2) && cord_2.between?(0, 2) && @board[cord_1][cord_2] == "_"  do
      puts "enter your cordinates again seperated by space like 0 0"
      cordinates = gets.chomp
      cords_array = cordinates.split
      cord_1 = cords_array[0].to_i
      cord_2 = cords_array[1].to_i
    end
    @board[cord_1][cord_2] = @player_mark
  end

  def check_winner
    check_rows
    check_columns
    check_digonals
  end

  def check_rows
    @board.each do |i|
      if i.all? { |j| j == "0" }
        @@winner = @player1
        @@turn_count = 10
      elsif i.all? { |j| j == "X" }
        @@winner = @player2
        @@turn_count = 10
      else
        nil
      end
    end
  end

  def check_columns
    flat = @board.flatten
    flat.each_with_index do |j, i|
      if flat[i] == "0" && flat[i + 3] == "0" && flat[i + 6] == "0"
        @@winner = @player1
        @@turn_count = 10
      elsif flat[i] == "X" && flat[i + 3] == "X" && flat[i + 6] == "X"
        @@winner = @player2
        @@turn_count = 10
      else
        nil
      end
    end
  end

  def check_digonals
    # binding.pry
    flat = @board.flatten
    if flat[0] == "0" && flat[4] == "0" && flat[8] == "0"
      @@winner = @player1
      @@turn_count = 10
    elsif flat[0] == "X" && flat[4] == "X" && flat[8] == "X"
      @@winner = @player2
      @@turn_count = 10
    else
      nil
    end
  end
end

puts 'Player_1 please enter your name:'
player_1 = gets.chomp
# player_1 = "Awais"
puts 'player_2 please enter your name:'
player_2 = gets.chomp
# player_2 = "zain"
game = Game.new(player_1, player_2)
game.play_game
