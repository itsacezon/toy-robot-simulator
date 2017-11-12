require "lib/table"
require "lib/entity"
require "app/controller"

RSpec.describe Controller do
  let(:table) { Table.new(height: 5, width: 5) }
  let(:robot) { Entity.new(x: 0, y: 0) }
  let(:controller) { Controller.new(table: table, robot: robot) }

  describe "#execute_action" do
  end
end
