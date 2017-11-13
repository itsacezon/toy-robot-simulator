require "lib/entity"

class Robot < Entity
  def move(table)
    return unless table.find_entity(@x, @y)
    @x += direction.delta_x
    @y += direction.delta_y
  end

  def rotate(table, directions, to_name)
    return unless table.find_entity(@x, @y)
    to_direction = directions.find_by_name(to_name)
    @direction = to_direction if to_direction
  end
end
