# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|cell| position_taken?(board, cell) && board[cell] == "X"} ||\
      combination.all? {|cell| position_taken?(board, cell) && board[cell] == "O"}
      return combination
    end
  end
  return false
end

def full?(board)
  board.none?{|mark| mark.nil? || mark == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if over?(board) && won?(board)
    combination = won?(board)
    if combination.length > 0
      return board[combination[0]]
    end
  end
end

