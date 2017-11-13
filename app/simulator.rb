require "lib/table"
require "app/command_log"
require "app/directions"
require "app/robot"

class Simulator
  def initialize
    @controller = Controller.new(
      robot: Robot.new,
      table: Table.new(height: 5, width: 5),
      directions: Directions.new
    )
  end

  def start
    $stdin.each_line { |line|
      @controller.execute_command(line.strip)
    }
  end
end
