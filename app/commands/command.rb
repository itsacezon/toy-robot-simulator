class Command
  attr_reader :directions, :robot, :table, :options

  def initialize(
    directions: Directions.new,
    robot: Robot.new,
    table: Table.new,
    options: []
  )
    @directions = directions
    @robot = robot
    @table = table
    @options = options
  end

  def execute
    raise NotImplementedError, "You must implement the execute method"
  end
end
