require "lib/surface"

class Table < Surface
  def find_robot
    entities.find { |entity| entity.is_a?(Robot) }
  end
end
