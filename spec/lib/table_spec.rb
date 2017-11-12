require "lib/table"
require "lib/entity"

RSpec.describe Table do
  describe "#place_entity" do
    let(:table) { Table.new(height: 5, width: 5) }
    let(:entity) { Entity.new(x: 0, y: 0) }

    context "no existing entity in coordinates" do
      it "adds the entity" do
        table.place_entity(entity)
        expect(table.entities).to include(entity)
      end
    end

    context "existing entity in coordinates" do
      before do
        table.place_entity(entity)
      end

      it "does not add the entity" do
        expect { table.place_entity(entity) }
          .not_to change { table.entities.size }
      end
    end
  end

  describe "#remove_entity" do
    let(:table) { Table.new(height: 5, width: 5) }
    let(:entity) { Entity.new(x: 0, y: 0) }

    before do
      table.place_entity(entity)
    end

    it "remove the entity" do
      expect { table.remove_entity(entity) }
        .to change { table.entities.size }.by(-1)
    end
  end

  describe "#within_bounds?" do
    let(:table) { Table.new(height: 5, width: 5) }

    context "coordinates are out of bounds" do
      it "returns false" do
        expect(table.within_bounds?(6, 4)).to eq(false)
        expect(table.within_bounds?(-1, 5)).to eq(false)
      end
    end

    context "coordinates are within bounds" do
      it "returns true" do
        expect(table.within_bounds?(3, 4)).to eq(true)
        expect(table.within_bounds?(2, 0)).to eq(true)
      end
    end
  end
end
