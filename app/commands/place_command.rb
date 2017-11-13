require "app/commands/command"

class PlaceCommand < Command
  def execute
    if place_options
      @robot.x = place_options[:x]
      @robot.y = place_options[:y]
      @robot.direction = place_options[:direction]
    end

    x, y = robot.x, robot.y
    return unless table.within_bounds?(x, y)

    existing_robot = table.find_robot
    if existing_robot
      table.remove_entity(existing_robot)
    end

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
