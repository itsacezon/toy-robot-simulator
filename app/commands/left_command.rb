require "app/commands/command"

class LeftCommand < Command
  def execute
    return unless table.find_robot == robot

    to_name =
      case robot.direction.name
      when :west then :south
      when :north then :west
      when :east then :north
      when :south then :east
      else ""
      end

    robot.rotate(table, directions, to_name)
  end
end
