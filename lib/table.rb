class Table
  attr_accessor :entities, :height, :width

  def initialize(params)
    @height = params.fetch(:height, 0)
    @width = params.fetch(:width, 0)
    @entities = []
  end

  def place_entity(entity)
  end

  def within_bounds?(entity)
    x, y = entity.x, entity.y
    x >= 0 && x < @width && y >= 0 && y <= @height
  end
end
