require "lib/table"
require "lib/entity"

RSpec.describe Table do
  describe "#add_entity" do
    let(:table) { Table.new(height: 5, width: 5) }
    let(:entity) { Entity.new(x: 0, y: 0) }

    it "adds the entity" do
      table.add_entity(entity)
      expect(table.entities).to include(entity)
    end
  end

  describe "#remove_entity" do
    let(:table) { Table.new(height: 5, width: 5) }
    let(:entity) { Entity.new(x: 0, y: 0) }

    before do
      table.add_entity(entity)
    end

    it "remove the entity" do
      table.remove_entity(entity)
      expect(table.entities).not_to include(entity)
    end
  end

  describe "#within_bounds?" do
    let(:table) { Table.new(height: 5, width: 5) }

    context "coordinates are out of bounds" do
      it "returns false" do
        expect(table.within_bounds?(6, 4)).to eq(false)
      end
    end

    context "coordinates are within bounds" do
      it "returns true" do
        expect(table.within_bounds?(3, 4)).to eq(true)
      end
    end
  end
end
