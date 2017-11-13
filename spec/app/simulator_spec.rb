require "app/simulator"

RSpec.describe Simulator do
  describe "#start" do
    context "PLACE command" do
      context "invalid syntax" do
        let(:simulator) { Simulator.new(input: "PLACE 1,1") }

        it "doesn't execute the place command" do
          expect(simulator.controller).not_to receive(:execute)
          simulator.start
        end
      end

      context "valid syntax" do
        let(:simulator) { Simulator.new(input: "PLACE 1,1,NORTH") }

        it "doesn't execute the place command" do
          expect(simulator.controller).to receive(:execute).with(PlaceCommand)
          simulator.start
        end
      end
    end

    context "MOVE command" do
      let(:simulator) { Simulator.new(input: "MOVE") }

      before { simulator.table.place_entity(simulator.robot) }

      it "executes the move command" do
        expect(simulator.controller).to receive(:execute).with(MoveCommand)
        simulator.start
      end
    end

    context "LEFT command" do
      let(:simulator) { Simulator.new(input: "LEFT") }

      before { simulator.table.place_entity(simulator.robot) }

      it "executes the left command" do
        expect(simulator.controller).to receive(:execute).with(LeftCommand)
        simulator.start
      end
    end

    context "RIGHT command" do
      let(:simulator) { Simulator.new(input: "RIGHT") }

      before { simulator.table.place_entity(simulator.robot) }

      it "executes the right command" do
        expect(simulator.controller).to receive(:execute).with(RightCommand)
        simulator.start
      end
    end

    context "REPORT command" do
      let(:simulator) { Simulator.new(input: "REPORT") }

      before { simulator.table.place_entity(simulator.robot) }

      it "executes the report command" do
        expect(simulator.controller).to receive(:execute).with(ReportCommand)
        simulator.start
      end
    end
  end
end
