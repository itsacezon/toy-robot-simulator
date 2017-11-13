class Direction
  attr_accessor :name, :delta_x, :delta_y

  def initialize(name, delta)
    @name = name
    @delta_x, @delta_y = delta
  end

  def == other
    @name == other.name &&
      @delta_x == other.delta_x &&
      @delta_y == other.delta_y
  end
end
