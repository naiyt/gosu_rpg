# Run with: bundle exec ruby sample_game.rb

require 'gosu_rpg'

module ZOrder
  BACKGROUND, UI = *0..2
end

def background_path(type, file)
  File.join('sample_game', 'assets', type, file)
end

class SampleState < GosuRPG::GameState
  def initialize
    super

    @window.caption = 'Sweet Sample State'
    @background_image = Gosu::Image.new(background_path('backgrounds', 'steampunk.png'), tileable: true)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @font.draw('A cool menu state!', 10, 10, 0)
  end

  def button_down(id)
    GosuRPG::GameState.switch(AnotherState.new) if id == Gosu::Kb2
  end
end

class AnotherState < GosuRPG::GameState
  def initialize
    super

    @window.caption = 'Whoa, a second state!'
    @background_image = Gosu::Image.new(background_path('backgrounds', 'space.png'), tileable: true)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @font.draw('This state is even better!!', 20, 20, 0)
  end

  def button_down(id)
    GosuRPG::GameState.switch(SampleState.new) if id == Gosu::Kb1
  end
end

GosuRPG.configure do |config|
  config.window    = GosuRPG::GameWindow.new(1280, 540)
  config.font_size = 50
end

GosuRPG.play(SampleState.new)
