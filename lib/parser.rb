class Parser
  attr_accessor :actions

  def initialize(actions = [])
    @actions = actions
  end

  def read_command(string)
    case string
    when /\APLACE (\S, ?)(\S, ?)([^,]+)\z/
    when /\AMOVE\z/
    when /\ALEFT\z/
    when /\ARIGHT\z/
    when /\AREPORT\z/
    end
  end
end
