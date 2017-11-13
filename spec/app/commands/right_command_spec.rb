require "app/directions"
require "app/table"
require "app/robot"
require "app/commands/right_command"

RSpec.describe RightCommand do
  let(:directions) { Directions.new }
  let(:north) { directions.find_by_name(:north) }
  let(:table) { Table.new(height: 5, width: 5) }
  let(:robot) { Robot.new(x: 0, y: 0, direction: north) }

  describe "#execute" do
    before { table.place_entity(robot) }

    it "changes the direction of the robot" do
      expect { RightCommand.new(robot: robot, table: table).execute }
        .to change { table.find_robot.direction.name }.from(:north).to(:east)
    end
  end
end
