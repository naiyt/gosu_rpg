# Run with: bundle exec ruby sample_game.rb

require 'gosu_rpg'

module ZOrder
  BACKGROUND, UI, CURSOR = *0..2
end

def asset_path(type, file)
  File.join('sample_game', 'assets', type, file)
end

class SampleState < GosuRPG::GameState
  def initialize
    super

    @window.caption = 'Sweet Sample State'
    @background_image = Gosu::Image.new(asset_path('backgrounds', 'steampunk.png'), tileable: true)
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
    @background_image = Gosu::Image.new(asset_path('backgrounds', 'space.png'), tileable: true)
    @cursor = Gosu::Image.new(asset_path('icons', 'arrow-cursor.png'), false)

    @text_field = GosuRPG::TextField.new(@window, @font, 10, @window.height - (@font.height + 15))
    @window.text_input = @text_field
  end

  def update
  end

  def draw
    # @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @text_field.draw(ZOrder::UI)
    @cursor.draw(@window.mouse_x, @window.mouse_y, ZOrder::CURSOR)
  end

  def button_down(id)
    # if id == Gosu::MsLeft then
      # @window.text_input = @text_field if @text_field.under_point?(@window.mouse_x, @window.mouse_y)
      # @window.text_input.move_caret(@window.mouse_x) unless @window.text_input.nil?
    # end
  end
end

GosuRPG.configure do |config|
  config.window    = GosuRPG::GameWindow.new(1280, 800)
  config.font_size = 50
end

GosuRPG.play(AnotherState.new)
