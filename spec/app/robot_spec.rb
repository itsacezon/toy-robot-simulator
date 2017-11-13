require "lib/table"
require "app/directions"
require "app/robot"

RSpec.describe Robot do
  let(:directions) { Directions.new }

  describe "#move" do
    let(:table) { Table.new(height: 5, width: 5) }
    let(:north) { directions.find_by_name(:north) }
    let(:robot) { Robot.new(x: 1, y: 1, direction: north) }

    context "robot is not placed in the table" do
      it "does not move the robot" do
        expect { robot.move(table) }
          .to change { robot.x }.by(0)
          .and change { robot.y }.by(0)
      end
    end

    context "robot is placed in the table" do
      before { table.place_entity(robot) }

      it "moves the robot one unit forward" do
        expect { robot.move(table) }
          .to change { robot.y }.by(1)
          .and change { robot.x }.by(0)
      end

      it "updates the table entity" do
        orig_robot = robot.dup
        robot.move(table)
        expect(table.find_entity(orig_robot)).not_to eq(robot)
      end
    end
  end

  describe "#rotate" do
    let(:table) { Table.new(height: 5, width: 5) }
    let(:north) { directions.find_by_name(:north) }
    let(:robot) { Robot.new(x: 1, y: 1, direction: north) }

    before { table.place_entity(robot) }

    context "invalid direction" do
      it "does not change the robot's direction" do
        expect { robot.rotate(table, directions, :northwest) }
          .not_to change { robot.direction.name }
      end
    end

    context "valid direction" do
      it "changes the robot's direction" do
        expect { robot.rotate(table, directions, :south) }
          .to change { robot.direction.name }.from(:north).to(:south)
          .and change { robot.direction.delta_y }.from(1).to(-1)
      end

      it "updates the table entity" do
        orig_robot = robot.dup
        robot.rotate(table, directions, :south)
        expect(table.find_entity(robot)).not_to eq(orig_robot)
      end
    end
  end
end
