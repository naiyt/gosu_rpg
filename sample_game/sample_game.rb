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
    @font.draw('A cool menu state!', 10, 10, 0)
  end
end

GosuRPG.configure do |config|
  config.window    = GosuRPG::GameWindow.new(500, 500)
  config.font_size = 50
end

GosuRPG.play(SampleState.new)
