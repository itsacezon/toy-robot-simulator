require "lib/table"
require "app/controller"
require "app/directions"
require "app/robot"

require "app/commands/place_command"

class Simulator
  def initialize
    @controller = Controller.new
    @directions = Directions.new
    @robot = Robot.new
    @table = Table.new(height: 5, width: 5)
  end

  def start
    $stdin.each_line do |line|
      case line.strip
      when /\APLACE (\d+, ?)(\d+, ?)([^,]+)\z/
        @controller.execute(PlaceCommand.new(robot: @robot, table: @table))
      when /\AMOVE\z/
      when /\ALEFT\z/
      when /\ARIGHT\z/
      when /\AREPORT\z/
      end
    end
  end
end
