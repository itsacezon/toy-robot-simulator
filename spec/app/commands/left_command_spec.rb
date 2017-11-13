require "app/directions"
require "app/table"
require "app/robot"
require "app/commands/left_command"

RSpec.describe LeftCommand do
  let(:directions) { Directions.new }
  let(:north) { directions.find_by_name(:north) }
  let(:table) { Table.new(height: 5, width: 5) }
  let(:robot) { Robot.new(x: 0, y: 0, direction: north) }

  describe "#execute" do
    before { table.place_entity(robot) }

    it "changes the direction of the robot" do
      expect { LeftCommand.new(robot: robot, table: table).execute }
        .to change { table.find_robot.direction.name }.from(:north).to(:west)
    end
  end
end
