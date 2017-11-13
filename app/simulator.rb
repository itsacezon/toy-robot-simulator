require "app/controller"
require "app/directions"
require "app/robot"
require "app/table"

require "app/commands/place_command"
require "app/commands/move_command"
require "app/commands/left_command"
require "app/commands/right_command"
require "app/commands/report_command"

class Simulator
  attr_reader :controller, :table, :robot

  def initialize(input: ARGF)
    @input = input
    @controller = Controller.new
    @directions = Directions.new
    @robot = Robot.new
    @table = Table.new(height: 5, width: 5)
  end

  def start
    @input.each_line do |line|
      sanitised_input = line.gsub(",", " ").strip

      command =
        case sanitised_input
        when /\APLACE (\d+) (\d+) (\S+)\z/ then PlaceCommand
        when /\AMOVE\z/ then MoveCommand
        when /\ALEFT\z/ then LeftCommand
        when /\ARIGHT\z/ then RightCommand
        when /\AREPORT\z/ then ReportCommand
        end

      if command
        params = {
          directions: @directions,
          robot: @robot,
          table: @table,
          options: sanitised_input.split(" ")
        }
        controller.execute(command.new(params))
      end
    end
  end
end
