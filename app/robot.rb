require "lib/entity"

class Robot < Entity
  def move(table)
    return unless table.find_entity(self)

    move_x = @x + direction.delta_x
    move_y = @y + direction.delta_y

    if table.within_bounds?(move_x, move_y)
      @x = move_x
      @y = move_y
    end
  end

  def rotate(table, directions, to_name)
    return unless table.find_entity(self)
    to_direction = directions.find_by_name(to_name)
    @direction = to_direction if to_direction
  end
end
