require "lib/entity"

class Robot < Entity
  def move(table)
    return unless table.find_entity(@x, @y)
    @x += direction.delta_x
    @y += direction.delta_y
  end

  def rotate(table, directions, to)
    return unless table.find_entity(@x, @y)
    return unless directions.find_by_name(to.name)
    @direction = to
  end
end
