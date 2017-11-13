class Controller
  attr_reader :commands

  def initialize
    @commands = []
  end

  def execute(command)
    command.execute
    @commands.push(command)
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
