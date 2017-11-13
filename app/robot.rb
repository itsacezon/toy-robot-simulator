require "lib/entity"

class Robot < Entity
  def move(table)
    return unless table.find_entity(@x, @y)
    @x += direction.delta_x
    @y += direction.delta_y
  end

  def rotate(table, direction)
    return unless table.find_entity(@x, @y)
    @direction = direction
  end
end
