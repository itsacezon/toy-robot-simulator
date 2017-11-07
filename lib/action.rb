class Action
  attr_accessor :command, :options

  def initialize(command, options = {})
    @command = command
    @options = options
  end
end
