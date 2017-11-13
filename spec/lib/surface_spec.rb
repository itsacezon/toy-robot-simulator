require "lib/surface"
require "lib/entity"
require "lib/direction"

RSpec.describe Surface do
  let(:direction) { Direction.new(name: :north, delta: [0, 1]) }

  describe "#place_entity" do
    let(:surface) { Surface.new(height: 5, width: 5) }
    let(:entity) { Entity.new(x: 0, y: 0, direction: direction) }

    context "no existing entity in coordinates" do
      it "adds the entity" do
        surface.place_entity(entity)
        expect(surface.entities).to include(entity)
      end
    end

    context "existing entity in coordinates" do
      before do
        surface.place_entity(entity)
      end

      it "does not add the entity" do
        expect { surface.place_entity(entity) }
          .not_to change { surface.entities.size }
      end
    end
  end

  describe "#remove_entity" do
    let(:surface) { Surface.new(height: 5, width: 5) }
    let(:entity) { Entity.new(x: 0, y: 0, direction: direction) }

    before do
      surface.place_entity(entity)
    end

    it "remove the entity" do
      expect { surface.remove_entity(entity) }
        .to change { surface.entities.size }.by(-1)
    end
  end

  describe "#within_bounds?" do
    let(:surface) { Surface.new(height: 5, width: 5) }

    context "coordinates are out of bounds" do
      it "returns false" do
        expect(surface.within_bounds?(6, 4)).to eq(false)
        expect(surface.within_bounds?(-1, 5)).to eq(false)
      end
    end

    context "coordinates are within bounds" do
      it "returns true" do
        expect(surface.within_bounds?(3, 4)).to eq(true)
        expect(surface.within_bounds?(2, 0)).to eq(true)
      end
    end
  end
end
