class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, character="X")
    input=input.to_i
    truPosition=input-1
    character = current_player
    @board[truPosition]=character
  end

  def position_taken?(position)
    if (@board[position]==" "|| @board[position]=="" || @board[position]==nil)
      false
    else
      true
    end
  end

  def valid_move?(position)
    int=position.to_i
    int=int-1
    if ( int.between?(0,10) && !position_taken?(int) )
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.chomp
    if valid_move?(position)
      move(position)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |spot|
    if (spot == "X" || spot == "O")
      counter += 1
    end
    end
    return counter
  end

  def current_player
    counter = turn_count
    if counter % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      return false
    end
    WIN_COMBINATIONS.each do |combo|
      if ((@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ) || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" ))
         return combo
       end
    end
    WIN_COMBINATIONS.each do |combo|
      if !((@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ) || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" ))
         return false
      end
    end
  end

  def full?
    @board.each do |spot|
    if spot == " "
      return false
    end
    end
    @board.each do |spot|
    if spot != " "
      return true
    end
    end
  end

  def draw?
    WIN_COMBINATIONS.each do |combo|
      if ((@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ) || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" ))
        return false
      end
    end
    counter = 0
    @board.each do |spot|
    if spot != " "
      counter+=1
      if counter>9
        return true
      end
    end
    end
    @board.each do |spot|
    if spot == " "
      return false
    end
    end
  end

  def over?
    WIN_COMBINATIONS.each do |combo|
      if ((@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ) || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" ))
        return true
      end
    end
    @board.each do |spot|
    if spot == " "
      return false
    end
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if ((@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ))
        return "X"
      end
    end
    WIN_COMBINATIONS.each do |combo|
      if ((@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" ))
        return "O"
      end
      end
    WIN_COMBINATIONS.each do |combo|
      if !((@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ) || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" ))
        return nil
      end
      end
  end

  def play
    while !(over? || won? || draw?) do
      turn
    end
    if won?
      the_winner = winner
      puts "Congratulations #{the_winner}!"
    end
    if draw?
      puts "Cats Game!"
    end
  end

end