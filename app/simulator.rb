require "app/controller"
require "app/directions"
require "app/robot"
require "app/table"

require "app/commands/place_command"
require "app/commands/move_command"
require "app/commands/left_command"
require "app/commands/report_command"

class Simulator
  def initialize
    @controller = Controller.new
    @directions = Directions.new
    @robot = Robot.new
    @table = Table.new(height: 5, width: 5)
  end

  def start
    params = {
      directions: @directions,
      robot: @robot,
      table: @table
    }

    $stdin.each_line do |line|
      sanitized_input = line.gsub(",", " ").strip
      case sanitized_input
      when /\APLACE /
        @controller.execute(PlaceCommand.new(params))
      when /\AMOVE\z/
        @controller.execute(MoveCommand.new(params))
      when /\ALEFT\z/
        @controller.execute(LeftCommand.new(params))
      when /\ARIGHT\z/
        @controller.execute(RightCommand.new(params))
      when /\AREPORT\z/
        @controller.execute(ReportCommand.new(params))
      end
    end
  end
end
