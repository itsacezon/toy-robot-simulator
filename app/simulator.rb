require "lib/table"
require "app/command_log"
require "app/directions"
require "app/robot"

class Simulator
  def initialize(robot: Robot.new)
    @robot = Robot.new
    @table = Table.new(height: 5, width: 5)
    @directions = [

    ]
  end

  def start
    controller = Controller.new(@robot, @table)
    $stdin.each_line { |command|
      controller.execute_action(command.strip)
    }
  end
end
