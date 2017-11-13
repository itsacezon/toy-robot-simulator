require "lib/table"
require "app/directions"
require "app/robot"

RSpec.describe Robot do
  describe "#move" do
    let(:table) { Table.new(height: 5, width: 5) }
    let(:direction) { Directions.new.find_by_name(:north) }
    let(:robot) { Robot.new(x: 1, y: 1, direction: direction) }

    context "robot is placed in the table" do
      before { table.place_entity(robot) }

      it "moves the robot one unit forward" do
        expect { robot.move(table) }
          .to change { robot.y }.by(1)
          .and change { robot.x }.by(0)
      end
    end

    context "robot is not placed in the table" do
      it "does not move the robot" do
        expect { robot.move(table) }
          .to change { robot.x }.by(0)
          .and change { robot.y }.by(0)
      end
    end
  end
end
