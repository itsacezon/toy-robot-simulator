class Direction
  attr_accessor :name, :delta_x, :delta_y

  def initialize(name, delta)
    @name = name
    @delta_x, @delta_y = delta
  end
end
