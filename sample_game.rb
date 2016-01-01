# Run with: bundle exec ruby sample_game.rb

require 'gosu_rpg'

class SampleWindow < GosuRPG::GameWindow
  def initialize
    super 700, 700
    self.caption = 'A sample Gosu RPG!'
  end

  def update

  end

  def draw

  end
end

window = SampleWindow.new
window.show
