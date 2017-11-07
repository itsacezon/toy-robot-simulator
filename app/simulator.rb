class Simulator
  attr_reader :robot, :table

  def initialize
    @robot = Robot.new
    @table = Table.new(height: 5, width: 5)
  end
end
