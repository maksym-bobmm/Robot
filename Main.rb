class Main
  def initialize(x = 5, y = 6)
    @x = x
    @y = y
    start
  end
  def start
    puts 'Enter command'
    loop do
      command = gets

    end
  end
  def valid_command?(command)
    case command.downcase
      when 'move', 'left', 'right', 'report'
        return true
      when "place "
        return true
      else
        return false
    end
  end
end
