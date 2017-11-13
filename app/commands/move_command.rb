require "app/commands/command"

class MoveCommand < Command
  def execute
    robot.move(table) if table.find_robot == robot
  end
end
