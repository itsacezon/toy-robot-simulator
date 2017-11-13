require "app/directions"

RSpec.describe Directions do
  let(:directions) { Directions.new }

  describe "#find_by_delta" do
    let(:north) { Direction.new(:north, [0, 1]) }

    it "returns the correct direction" do
      expect(directions.find_by_delta([0, 1])).to eq(north)
    end
  end

  describe "#find_by_name" do
    let(:north) { Direction.new(:north, [0, 1]) }

    it "returns the correct direction" do
      expect(directions.find_by_name(:north)).to eq(north)
    end
  end
end
