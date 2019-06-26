
class Robot
  attr_accessor x
  attr_accessor y
  @placed = false
  public
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
  private
  def can_move?

  end


end