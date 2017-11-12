require "lib/entity"

class Robot < Entity
  def move(table)
    return unless table.find_entity(@x, @y)
    @x += direction.delta_x
    @y += direction.delta_y
  end
end
