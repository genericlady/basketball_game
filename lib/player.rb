class Player
  attr_reader :team

  def initialize(team="shirts")
    @team = team
  end

  def update(basketball_game)
    if basketball_game.score_changed?
      puts "High fives their team members."
    end

    if basketball_game.over?
      puts "Team #{self.team} walks off the court and shakes the other teams hands"
    end
  end

  def score_point
    case attempt = rand(100)
    when three_pointer?
      {points_scored: 3}
    when two_pointer?
      {points_scored: 2}
    else
      {points_scored: 0}
    end
  end

  private
  def three_pointer?
    ->(attempt) { attempt > 80 }
  end

  def two_pointer?
    ->(attempt) { attempt > 60 }
  end
end
