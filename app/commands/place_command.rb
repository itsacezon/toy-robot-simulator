require "app/commands/command"

class PlaceCommand < Command
  def execute
    x, y, direction =
      if place_options
        [place_options[:x], place_options[:y], place_options[:direction]]
      else
        [robot.x, robot.y, robot.direction]
      end

    return unless table.within_bounds?(x, y)

    existing_robot = table.find_robot
    if existing_robot
      table.remove_entity(existing_robot)
    end

    @robot.x = x
    @robot.y = y
    @robot.direction = direction

    table.place_entity(robot)
  end

  private

  def place_options
    return false if options.empty?
    _, x, y, dir_name = options

    @place_options ||= {
      x: Integer(x),
      y: Integer(y),
      direction: directions.find_by_name(dir_name.downcase.to_sym)
    }
  end
end
