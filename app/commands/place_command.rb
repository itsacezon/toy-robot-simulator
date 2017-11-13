require "app/commands/command"

class PlaceCommand < Command
  def execute
    x, y = robot.x, robot.y
    return unless table.within_bounds?(x, y)

    existing_robot = table.find_robot
    if existing_robot
      table.remove_entity(existing_robot)
    end

    table.place_entity(robot)
  end
end
