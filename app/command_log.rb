class CommandLog
  attr_reader :commands

  def initialize
    @commands = []
  end

  def run_command(command)
    command.execute
    @commands.push(command)
  end
end
