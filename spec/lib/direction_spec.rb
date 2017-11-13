require "lib/direction"

RSpec.describe Direction do
  describe "#==" do
    let(:north) { Direction.new(name: :north, delta: [0, 1]) }

    context "same direction" do
      let(:another_north) { Direction.new(name: :north, delta: [0, 1]) }

      it "compares correctly" do
        expect(north == another_north).to be(true)
      end
    end

    context "different direction" do
      let(:south) { Direction.new(name: :south, delta: [0, -1]) }

      it "compares correctly" do
        expect(north == south).to be(false)
      end
    end
  end
end
