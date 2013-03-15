module Battle
  class PlayerController
    attr_reader :window

    def initialize(window)
      @window = window
    end

    def thrust?
      window.button_down? Gosu::KbUp
    end

    def left?
      window.button_down? Gosu::KbLeft
    end

    def right?
      window.button_down? Gosu::KbRight
    end
  end
end