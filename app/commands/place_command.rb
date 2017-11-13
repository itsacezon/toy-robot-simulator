require "app/commands/command"

class PlaceCommand < Command
  def execute
    x, y = robot.x, robot.y
    if table.within_bounds?(x, y)
      table.place_entity(robot)
    end
  end
end
