class Controller
  attr_reader :robot, :table

  def initialize(params)
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

  def move
    delta_x, delta_y = robot.direction.delta
  end

  def report
    puts "Output: #{robot.x},#{robot.y},#{robot.direction.name}"
  end
end
