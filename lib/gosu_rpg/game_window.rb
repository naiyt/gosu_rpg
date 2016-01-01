require 'singleton'

module GosuRPG
  class GameWindow < Gosu::Window
    include Singleton

    attr_accessor :state

    def initialize
      super 800, 600 # TODO: use a config object to set these
    end

    def update
      @state.update
    end

    def draw
      @state.draw
    end

    def button_down(id)
      close if id == Gosu::KbEscape
      @state.button_down(id)
    end
  end
end
