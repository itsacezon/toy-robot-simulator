class Controller
  attr_reader :directions, :robot, :table

  def initialize(params)
    @directions = params.fetch(:directions)
    @robot = params.fetch(:robot)
    @table = params.fetch(:table)
  end

  def execute_action(command)
    case command
    when /\APLACE (\d+, ?)(\d+, ?)([^,]+)\z/
    when /\AMOVE\z/
    when /\ALEFT\z/
    when /\ARIGHT\z/
    when /\AREPORT\z/
    end
  end

  def place
    table.place_entity(robot)
  end

  def move
    robot.move(table)
  end

  def rotate_left
    robot.rotate(table, directions, :west)
  end

  def rotate_right

  end

  def report
    direction_name = robot.direction.name.to_s.upcase
    puts "Output: #{robot.x},#{robot.y},#{direction_name}"
  end
end
