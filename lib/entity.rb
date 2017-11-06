class Entity
  attr_accessor :x, :y, :direction

  def initialize(params)
    @x = params.fetch(:x, 0)
    @y = params.fetch(:y, 0)
  end
end
