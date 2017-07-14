require "spec_helper"

RSpec.describe BasketballGame do
  let(:basketball_game) { BasketballGame.new }

  context "Is observable and responds to methods that will" do
    it "add a new observer" do
      expect(basketball_game).to respond_to(:add_observer)
    end

    it "remove an observer" do
      expect(basketball_game).to respond_to(:remove_observer)
    end

    it "notify an observer" do
      expect(basketball_game).to respond_to(:notify_observers)
    end

    it "know if the score has changed" do
      expect(basketball_game).to respond_to(:score_changed?)
    end
  end

  it "can have many observers" do
    expect(basketball_game.observers.class).to eq(Array)
  end

  it "can add a new observer" do
    player = double("Player")
    basketball_game.add_observer(player)
    expect(basketball_game.observers.length).to eq(1)
  end

  it "can remove an observer" do
    player = double("Player")
    basketball_game.add_observer(player)
    basketball_game.remove_observer(player)

    expect(basketball_game.observers.length).to eq(0)
  end

  xit "can notify observers" do
    basketball_game.add_observer(player)
    basketball_game.notify_observers

  end

  xit "Can notify observers when the score changes." do
  end
end
