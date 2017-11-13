class Surface
  attr_reader :entities, :height, :width

  def initialize(height: 0, width: 0)
    @height = height
    @width = width
    clear_entities
  end

  def clear_entities
    @entities = []
  end

  def find_entity(obj)
    entities.find do |entity|
      entity.x == obj.x &&
        entity.y == obj.y &&
        entity.direction == obj.direction
    end
  end

  def place_entity(entity)
    entities.push(entity) unless find_entity(entity)
  end

  def remove_entity(entity)
    entities.delete(entity)
  end

  def within_bounds?(x, y)
    x >= 0 && x < width && y >= 0 && y <= height
  end
end
