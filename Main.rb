class Main
  def initialize(x = 5, y = 6)
    @x = x
    @y = y
    @robot = Robot.new
    start
  end
  def start
    puts 'Enter command'
    loop do
      command = gets
      if valid_command?(command)
        result = @robot.Execute_command(command)
        puts result
      else
        puts 'Wrong command'
      end
    end
  end

  def valid_command?(command)
    case command.downcase
      when 'move', 'left', 'right', 'report'
        return true
      when "place"
        return true
      else
        return false
    end
  end
end
