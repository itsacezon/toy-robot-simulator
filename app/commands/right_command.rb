require "app/commands/command"

class RightCommand < Command
  def execute
    return unless table.find_robot == robot

    to_name =
      case robot.direction.name
      when :west then :north
      when :north then :east
      when :east then :south
      when :south then :west
      else ""
      end

    robot.rotate(table, directions, to_name)
  end
end
