# frozen_string_literal: true

# class of robot
class Robot
  @placed = nil
  def execute_command(command, rows, columns)
    case command.downcase
    when 'move' then move(rows, columns)
    when 'left' then left
    when 'right' then right
    when 'report' then report(rows, columns)
    else
      arr = command.split       #=> ['place' 'x,y,direction']
      args = arr[1].split(',')  #=> ['x', 'y', 'direction']
      place(args[0].to_i, args[1].to_i, args[2], rows, columns)
    end
  end

  def valid_command?(command)
    case command.downcase
    when 'move', 'left', 'right', 'report' then return true
    else
      command_array = command.downcase.split
      return false if command_array[0] != 'place' || command_array.size <= 1

      command_args = command_array[1].split(',')

      return false unless command_args[0].to_i.to_s == command_args[0] ||
                          command_args[1].to_i.to_s == command_args[1] # input x or y not a number
      return false if %w[north south east west].none?(command_args[2])
    end
    true
  end

  private

  def can_move?(rows, columns)
    case @direction.downcase
    when 'north'
      return true if columns.find_index(1) + 1 < columns.size
    when 'south'
      return true if columns.find_index(1) - 1 >= 0
    when 'east'
      return true if rows.find_index(1) + 1 < rows.size
    else # 'west'
      return true if (rows.find_index(1) - 1) >= 0
    end
    false
  end

  def place(x_pos, y_pos, direction, rows, columns)
    if x_pos < rows.size && x_pos >= 0 && y_pos < columns.size && y_pos >= 0
      rows[x_pos] = 1
      columns[y_pos] = 1
      @direction = direction
      @placed = true
    else
      puts 'Out of board'
    end
  end

  def move(rows, columns)
    return unless @placed

    return unless can_move?(rows, columns)

    case @direction
    when 'north' then step(columns, 1)
    when 'south' then step(columns, -1)
    when 'east' then step(rows, 1)
    else step(rows, -1) # 'west'
    end
  end

  def step(arr, step_index)
    index = arr.find_index(1)
    arr[index] = 0
    arr[index + step_index] = 1
  end

  def left
    return unless @placed

    return @direction = 'west' if @direction == 'north'
    return @direction = 'east' if @direction == 'south'
    return @direction = 'north' if @direction == 'east'

    @direction = 'south' if @direction == 'west'
  end

  def right
    return unless @placed

    return @direction = 'east' if @direction == 'north'
    return @direction = 'west' if @direction == 'south'
    return @direction = 'south' if @direction == 'east'

    @direction = 'north' if @direction == 'west'
  end

  def report(rows, columns)
    return unless @placed

    puts "x:#{rows.find_index(1)}, y:#{columns.find_index(1)}, direction:#{@direction}"
  end
end
