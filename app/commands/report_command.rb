require "app/commands/command"

class ReportCommand < Command
  def execute
    return unless table.find_robot
    direction_name = robot.direction.name.to_s.upcase
    puts "Output: #{robot.x},#{robot.y},#{direction_name}"
  end
end
