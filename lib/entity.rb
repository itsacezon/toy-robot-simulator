class Entity
  attr_accessor :x, :y, :direction

  def initialize(params)
    @x = params.fetch(:x, 0)
    @y = params.fetch(:y, 0)
    @direction = params.fetch(:direction, nil)
  end

  def move(table)
    raise NotImplementedError, "You must implement the move method"
  end

  def rotate(table, directions, to)
    raise NotImplementedError, "You must implement the rotate method"
  end
end
