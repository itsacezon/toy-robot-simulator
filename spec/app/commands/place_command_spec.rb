require "app/directions"
require "app/table"
require "app/robot"
require "app/commands/place_command"

RSpec.describe PlaceCommand do
  let(:directions) { Directions.new }
  let(:north) { directions.find_by_name(:north) }
  let(:table) { Table.new(height: 5, width: 5) }

  describe "#execute" do
    context "when robot is out of bounds" do
      let(:robot) { Robot.new(x: -1, y: 0, direction: north) }

      it "does not place the robot" do
        expect { PlaceCommand.new(table: table, robot: robot).execute }
          .not_to change { table.entities.size }
      end
    end

    context "when robot is within bounds" do
      let(:robot) { Robot.new(x: 0, y: 0, direction: north) }

      it "places the robot" do
        expect { PlaceCommand.new(table: table, robot: robot).execute }
          .to change { table.entities.size }.from(0).to(1)
      end

      context "existing robot" do
        let(:another_robot) { Robot.new(x: 1, y: 1, direction: north) }
        before { table.place_entity(another_robot) }

        it "removes the existing robot" do
          expect(table).to receive(:remove_entity)
          PlaceCommand.new(table: table, robot: robot).execute
        end

        it "places the new robot" do
          PlaceCommand.new(table: table, robot: robot).execute
          expect(table.find_robot).to eq(robot)
        end
      end
    end
  end
end
