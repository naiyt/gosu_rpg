# https://www.omniref.com/ruby/gems/gosu/0.7.24/universal-darwin/files/examples/TextInput.rb#line=153

module GosuRPG
  class TextField < Gosu::TextInput
    INACTIVE_COLOR  = 0xcc666666
    ACTIVE_COLOR    = 0xccff6666
    SELECTION_COLOR = 0xcc0000ff
    CARET_COLOR     = 0xffffffff
    PADDING = 5

    attr_reader :x, :y

    def initialize(window, font, x, y)
      super()

      @window, @font, @x, @y = window, font, x, y

      self.text = "nate@hacksh # "
    end

    def draw(zorder)
      background_color = @window.text_input == self ? ACTIVE_COLOR : INACTIVE_COLOR

      @window.draw_quad(x - PADDING,         y - PADDING,          background_color,
                        x + width + PADDING, y - PADDING,          background_color,
                        x - PADDING,         y + height + PADDING, background_color,
                        x + width + PADDING, y + height + PADDING, background_color, 0)

      draw_caret if @window.text_input == self

      @font.draw(self.text, x, y, zorder)
    end

    def width
      @font.text_width(self.text)
    end

    def height
      @font.height
    end

    def under_point?(mouse_x, mouse_y)
      mouse_x > x - PADDING && mouse_x < x + width + PADDING &&
        mouse_y > y - PADDING && mouse_y < y + height + PADDING
    end

    def move_caret(mouse_x)
      1.upto(self.text.length) do |i|
        if mouse_x < x + @font.text_width(text[0...i])
          self.caret_pos = self.selection_start = i - 1
          return
        end
      end
      self.caret_pos = self.selection_start = self.text.length
    end

    private

    def draw_caret
      pos_x = x + @font.text_width(self.text[0...self.caret_pos])
      sel_x = x + @font.text_width(self.text[0...self.selection_start])

      @window.draw_line(pos_x, y, CARET_COLOR, pos_x, y + height, CARET_COLOR, 0)
    end
  end
end
