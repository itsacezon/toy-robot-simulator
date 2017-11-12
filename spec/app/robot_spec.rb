require "lib/table"
require "lib/direction"
require "app/robot"

RSpec.describe Robot do
  describe "#move" do
    let(:table) { Table.new(height: 5, width: 5) }
    let(:direction) { Direction.new(:north, [0, 1]) }
    let(:robot) { Robot.new(x: 1, y: 1, direction: direction) }

    context "robot is placed in the table" do
      before { table.place_entity(robot) }

      it "moves the robot one unit forward" do
        expect { robot.move(table) }
          .to change { robot.y }.by(1)
      end
    end
  end
end
