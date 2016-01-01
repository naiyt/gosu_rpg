module GosuRPG
  class GameWindow < Gosu::Window
    def initialize(w_height, w_width)
      super W_WIDTH, W_HEIGHT
    end

    def update
      raise NotImplemented('Your Window class must implement the update method!')
    end

    def draw
      raise NotImplemented('Your Window class must implement the draw method!')
    end
  end
end
