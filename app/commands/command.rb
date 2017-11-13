class Command
  attr_reader :directions, :robot, :table

  def initialize(directions: Directions.new, robot:, table:)
    @directions = directions
    @robot = robot
    @table = table
  end

  def execute
    raise NotImplementedError, "You must implement the execute method"
  end
end
