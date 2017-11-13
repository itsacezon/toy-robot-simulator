class Table
  attr_reader :entities, :height, :width

  def initialize(params)
    @height = params.fetch(:height, 0)
    @width = params.fetch(:width, 0)
    clear_entities
  end

  def clear_entities
    @entities = []
  end

  def find_entity(x, y)
    entities.find { |entity| entity.x == x && entity.y == y }
  end

  def place_entity(entity)
    entities.push(entity) unless find_entity(entity.x, entity.y)
  end

  def remove_entity(entity)
    entities.delete(entity)
  end

  def within_bounds?(x, y)
    x >= 0 && x < width && y >= 0 && y <= height
  end
end
