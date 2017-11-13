require "lib/direction"

class Directions
  def all
    @all ||= [
      Direction.new(:west, [-1, 0]),
      Direction.new(:north, [0, 1]),
      Direction.new(:east, [0, 1]),
      Direction.new(:south, [0, -1])
    ]
  end

  def find_by_delta(delta)
    all.find { |d| [d.delta_x, d.delta_y] == delta }
  end

  def find_by_name(name)
    all.find { |d| d.name == name }
  end
end
