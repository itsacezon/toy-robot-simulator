require "app/directions"
require "app/table"
require "app/robot"
require "app/commands/move_command"

RSpec.describe MoveCommand do
  let(:directions) { Directions.new }
  let(:north) { directions.find_by_name(:north) }
  let(:table) { Table.new(height: 5, width: 5) }

  describe "#execute" do
    let(:robot) { Robot.new(x: 0, y: 0, direction: north) }

    context "when no robot is placed" do
      it "does not call the move method" do
        expect(robot).not_to receive(:move)
        MoveCommand.new(robot: robot, table: table).execute
      end
    end

    context "when a robot is placed" do
      before { table.place_entity(robot) }

      it "calls the move method" do
        expect(robot).to receive(:move)
        MoveCommand.new(robot: robot, table: table).execute
      end
    end
  end
end
