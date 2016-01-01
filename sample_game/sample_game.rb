# Run with: bundle exec ruby sample_game.rb

require 'gosu_rpg'

class SampleState < GosuRPG::GameState
  def initialize
    super

    @window.caption = 'Sweet Sample State'
  end

  def update

  end

  def draw

  end
end

GosuRPG.configure do |config|
  config.window = GosuRPG::GameWindow.new(1920, 1080)
end

GosuRPG.play(SampleState.new)
