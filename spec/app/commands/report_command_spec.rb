require "app/directions"
require "app/table"
require "app/robot"
require "app/commands/report_command"

RSpec.describe ReportCommand do
  let(:directions) { Directions.new }
  let(:north) { directions.find_by_name(:north) }
  let(:table) { Table.new(height: 5, width: 5) }
  let(:robot) { Robot.new(x: 0, y: 0, direction: north) }

  describe "#execute" do
    before { table.place_entity(robot) }

    it "displays the output" do
      expect { ReportCommand.new(robot: robot, table: table).execute }
        .to output("Output: 0,0,NORTH\n").to_stdout
    end
  end
end
