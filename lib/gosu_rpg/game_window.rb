module GosuRPG
  class GameWindow < Gosu::Window
    def initialize(w_width, w_height)
      super w_width, w_height
    end

    def update
      raise NotImplemented, 'Your Window class must implement the update method!'
    end

    def draw
      raise NotImplemented, 'Your Window class must implement the draw method!'
    end
  end
end
