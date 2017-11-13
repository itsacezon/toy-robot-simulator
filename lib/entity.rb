class Entity
  attr_accessor :x, :y, :direction

  def initialize(direction:, x: 0, y: 0)
    @x = x
    @y = y
    @direction = direction
  end

  def move(table)
    raise NotImplementedError, "You must implement the move method"
  end

  def rotate(table, directions, to)
    raise NotImplementedError, "You must implement the rotate method"
  end
end
