require "app/controller"
require "app/directions"
require "app/robot"
require "app/table"

require "app/commands/place_command"
require "app/commands/move_command"
require "app/commands/report_command"

class Simulator
  def initialize
    @controller = Controller.new
    @directions = Directions.new
    @robot = Robot.new
    @table = Table.new(height: 5, width: 5)
  end

  def start
    $stdin.each_line do |line|
      sanitized_input = line.gsub(",", " ").strip
      case sanitized_input
      when /\APLACE /
        @controller.execute(PlaceCommand.new(robot: @robot, table: @table))
      when /\AMOVE\z/
        @controller.execute(MoveCommand.new(robot: @robot, table: @table))
      when /\ALEFT\z/
      when /\ARIGHT\z/
      when /\AREPORT\z/
        @controller.execute(ReportCommand.new(robot: @robot, table: @table))
      end
    end
  end
end
