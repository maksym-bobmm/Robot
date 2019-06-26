class Robot
  attr_accessor x
  attr_accessor y
  @placed = false
  public
  def Execute_command(command)
    case command.downcase
    when 'move'
      Move
    when 'left'
      Left
    when 'right'
      Right
    when 'report'
      Report
    else
      args = command.split
      Place(args[1].to_i, args[2].to_i, args[3].to_i)
    end
  end
  private
  def can_move?

  end

  def Place(x, y, f)
    @x = x
    @y = y
    @f = f
    @placed = true
  end
  def Move
    if @placed
      if can_move?

      end
    end
  end
  def Left

  end
  def Right

  end
  def Report

  end

end