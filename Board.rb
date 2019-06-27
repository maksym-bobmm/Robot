require_relative 'Robot'
class Board
  attr_accessor :rows, :columns

  def start
    puts 'Enter command'
    loop do
      command = gets.chop
      if @robot.valid_command?(command)
        @robot.execute_command(command, @rows, @columns)
      else
        puts 'Wrong command'
      end
    end
  end

  def initialize(x = 5, y = 6)
    fill_the_matrix(x, y)
    @robot = Robot.new
  end

  private

  def fill_the_matrix(x, y)
    @rows = Array.new(x, 0)
    @columns = Array.new(y, 0)
  end
end



Board.new().start






=begin
[4][0]  [4][1]  [4][2]  [4][3]  [4][4]  [4][5]          [0][0]  [0][1]  [0][2]  [0][3]  [0][4]  [0][5]
[3][0]  [3][1]  [3][2]  [3][3]  [3][4]  [3][5]          [1][0]  [1][1]  [1][2]  [1][3]  [1][4]  [1][5]
[2][0]  [2][1]  [2][2]  [2][3]  [2][4]  [2][5]          [2][0]  [2][1]  [2][2]  [2][3]  [2][4]  [2][5]
[1][0]  [1][1]  [1][2]  [1][3]  [1][4]  [1][5]          [3][0]  [3][1]  [3][2]  [3][3]  [3][4]  [3][5]
[0][0]  [0][1]  [0][2]  [0][3]  [0][4]  [0][5]          [4][0]  [4][1]  [4][2]  [4][3]  [4][4]  [4][5]
=end
