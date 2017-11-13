require "lib/table"
require "app/directions"
require "app/robot"
require "app/controller"

RSpec.describe Controller do
  let(:table) { Table.new(height: 5, width: 5) }
  let(:directions) { Directions.new }
  let(:robot) { Robot.new(x: 0, y: 0, direction: directions.find_by_name(:north)) }
  let(:controller) { Controller.new(table: table, robot: robot) }

  describe "#execute_action" do
  end
end
