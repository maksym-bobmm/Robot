class Robot
  @placed = nil
public
  def execute_command(command, rows, columns)
    case command.downcase
    when 'move'
      move(rows, columns)
    when 'left'
      left
    when 'right'
      right
    when 'report'
      report(rows, columns)
    else
      arr = command.split       #=> ['place' 'x,y,direction']
      args = arr[1].split(',')  #=> ['x', 'y', 'direction']
      place(args[0].to_i, args[1].to_i, args[2], rows, columns)
    end
  end

  def valid_command?(command)
    case command.downcase
    when 'move', 'left', 'right', 'report'
      return true
    else
      command_array = command.downcase.split
      if command_array[0] != 'place'
        return false
      else
        if command_array.size <=1
          return false
        end
        command_args = command_array[1].split(',')
        if (Integer(command_args[0]) rescue nil) == nil
          return false
        elsif (Integer(command_args[1]) rescue nil) == nil
          return false
        elsif %w[north south east west].none?(command_args[2])
          return false
        else
          return true
        end
      end
    end
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
      else        #'west'
          return true if (rows.find_index(1) - 1) >= 0
      end
    false
  end

  def place(x, y, direction, rows, columns)
    if x < rows.size && x >= 0 && y < columns.size && y >= 0
      rows[x] = 1
      columns[y] = 1
      @direction = direction
      @placed = true
    else
      puts "Out of board"
    end
  end

  def move(rows, columns)
    if @placed
      if can_move?(rows, columns)
        if @direction == 'north'
          index = columns.find_index(1)
          columns[index] = 0
          columns[index + 1] = 1
        elsif @direction == 'south'
          index = columns.find_index(1)
          columns[index] = 0
          columns[index - 1] = 1
        elsif @direction == 'east'
          index = rows.find_index(1)
          rows[index] = 0
          rows[index + 1] = 1
        else            #west
          index = rows.find_index(1)
          rows[index] = 0
          rows[index - 1] = 1
        end
      end
    end
  end
  def left
    if @placed
      if @direction == 'north'
        @direction = 'west'
      elsif @direction == 'south'
        @direction = 'east'
      elsif @direction == 'east'
        @direction = 'north'
      else            #west
        @direction = 'south'
      end
    end
  end
  def right
    if @placed
      if @direction == 'north'
        @direction = 'east'
      elsif @direction == 'south'
        @direction = 'west'
      elsif @direction == 'east'
        @direction = 'south'
      else            #west
        @direction = 'north'
      end
    end
  end
  def report(rows, columns)
    if @placed
      puts "x:#{rows.find_index(1)}, y:#{columns.find_index(1)}, direction:#{@direction}"
    end
  end
end