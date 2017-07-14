class BasketballGame
  attr_reader :observers

  def initialize
    @observers = []
    @time_remaining = 30
    @last_shirts_score = 0
    @last_skins_score = 0
    @shirts_score = 0
    @skins_score = 0
  end

  def add_observer(observer)
    @observers.push(observer)
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def update_observers
    observers.each { |o| o.update(self) }
  end

  def score_changed?
    @last_skins_score < @skins_score || @last_shirts_score < @shirts_score
  end

  def over?
    time_remaining <= 0
  end

  def update_team_score(player, points)
    if player.team == "skins"
      @last_skins_score = @skins_score
      @skins_score += points
    elsif player.team == "shirts"
      @last_shirts_score = @shirts_score
      @shirts_score += points
    end

    puts "#{player.team} just scored #{points}!"
  end

  def last_shirts_score=(points)
    @last_shirts_score
  end

  def last_skins_score=(points)
    @last_skins_score
  end

  def shirts_score=(points)
    @shirts_score
  end

  def skins_score=(points)
    @skins_score
  end

  def last_shirts_score
    @last_shirts_score
  end

  def last_skins_score
    @last_skins_score
  end

  def shirts_score
    @shirts_score
  end

  def skins_score
    @skins_score
  end

  def time_remaining
    @time_remaining
  end

  def run
    while time_remaining >= 0 do

      observers.each do |p| 
        case p.score_point
        when {points_scored: 3}
          update_team_score(p, 3)
        when {points_scored: 2}
          update_team_score(p, 2)
        end
      end

      update_observers

      @time_remaining -= 1
      sleep 0.25
    end
  end


end
