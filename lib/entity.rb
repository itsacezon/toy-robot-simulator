class Entity
  attr_accessor :x, :y, :direction

  def initialize(direction:, x: 0, y: 0)
    @x = x
    @y = y
    @direction = direction
  end

  def move(surface)
    raise NotImplementedError, "You must implement the move method"
  end

  def rotate(surface, directions, to)
    raise NotImplementedError, "You must implement the rotate method"
  end
end
