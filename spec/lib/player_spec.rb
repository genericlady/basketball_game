require "spec_helper"

RSpec.describe Player do
  let(:player) { Player.new }

  context "Is an observer and responds to methods that will" do
    it "update itself" do
      expect(player).to respond_to(:update)
    end
  end

  xit "update itself of any changes to the games score" do
  end

  xit "update itself when the game is over" do
  end
end
