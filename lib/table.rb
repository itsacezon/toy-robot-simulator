class Table
  attr_accessor :entities, :height, :width

  def initialize(params)
    @height = params.fetch(:height, 0)
    @width = params.fetch(:width, 0)
    @entities = []
  end

  def add_entity(entity)
    @entities << entity
  end

  def remove_entity(entity)
    @entiries.delete(entity)
  end

  def within_bounds?(x, y)
    x >= 0 && x < @width && y >= 0 && y <= @height
  end
end
