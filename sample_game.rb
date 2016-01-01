# Run with: bundle exec ruby sample_game.rb

require 'gosu_rpg'

class SampleState < GosuRPG::GameState
  def initialize
  end

  def update

  end

  def draw

  end
end

window = GosuRPG::GameWindow.instance
state = SampleState.new
GosuRPG::GameState.switch(state)
window.show
