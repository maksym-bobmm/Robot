# frozen_string_literal: true

require_relative 'robot'
# main class of program
class Main
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

  def initialize(x_pos = 5, y_pos = 6)
    fill_the_matrix(x_pos, y_pos)
    @robot = Robot.new
  end

  private

  def fill_the_matrix(x_pos, y_pos)
    @rows = Array.new(x_pos, 0)
    @columns = Array.new(y_pos, 0)
  end
end

Main.new.start
