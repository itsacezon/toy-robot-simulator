require "app/robot"

class Command
  attr_reader :robot, :table

  def initialize(robot:, table:)
    @robot = robot
    @table = table
  end

  def execute
    raise NotImplementedError, "You must implement the execute method"
  end
end
