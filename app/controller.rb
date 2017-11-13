class Controller
  attr_reader :commands

  def initialize
    @commands = []
  end

  def execute(command)
    command.execute
    @commands.push(command)
  end
end
