class Controller
  attr_accessor :robot, :table

  def initialize(params)
    @robot = params.fetch(:robot)
    @table = params.fetch(:table)
  end

  def get_action(command)
    case command
    when /\APLACE (\S, ?)(\S, ?)([^,]+)\z/
    when /\AMOVE\z/
    when /\ALEFT\z/
    when /\ARIGHT\z/
    when /\AREPORT\z/
    end
  end
end
