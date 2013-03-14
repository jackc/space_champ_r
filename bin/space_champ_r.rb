require 'gosu'

class Vector2d
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def +(other)
    Vector2d.new x + other.x, y + other.y
  end
end

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

class Ship
  attr_reader :position
  attr_reader :velocity
  attr_reader :direction
  attr_reader :sprite
  attr_reader :controller

  def initialize(sprite, position, direction, controller)
    @position = position
    @velocity = Vector2d.new(0, 0)
    @direction = direction
    @sprite = sprite
    @controller = controller
  end

  def update
    # @position += Vector2d.new(0, 1) if controller.thrust?
    @direction -= 0.1 if controller.left?
    @direction += 0.1 if controller.right?
    @direction += (Math::PI * 2) while @direction < 0
    @direction -= (Math::PI * 2) while (Math::PI * 2) < @direction

    if controller.thrust?
      acceleration = Vector2d.new(
        Math.sin(direction) * 0.1,
        -Math.cos(direction) * 0.1
      )
      @velocity += acceleration
    end

    @position += @velocity
    # @position += Vector2d.new(-1, 0) if controller.left?
    # @position += Vector2d.new(1, 0) if controller.right?
  end

  def draw
    frame = (64.0 / (Math::PI * 2) * direction).to_i
    @sprite[frame].draw position.x, position.y, 0
  end
end


class SpaceChampRWindow < Gosu::Window
  def initialize
   super(640, 480, false)
   self.caption = 'Space Champ R'
   @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
   @image = Gosu::Image.new self, 'resources/images/cruiser.bmp'
   @ship_sprite = Gosu::Image.load_tiles self, 'resources/images/cruiser.bmp', 96, 96, false
   @player_controller = PlayerController.new self
   @ship = Ship.new @ship_sprite, Vector2d.new(0, 0), 0, @player_controller
  end

  def update
    @ship.update
  end

  def draw
    tile =
    @ship.draw
    @font.draw "Space Champ R (ESC to exit)", 10, 10, 1
    @font.draw Time.now.strftime('%m/%d/%Y %I:%M:%S %p'), 10, 50, 1
    @font.draw @ship.direction, 10, 90, 1
    @font.draw Math.sin(@ship.direction), 10, 130, 1
    @font.draw Math.cos(@ship.direction), 10, 170, 1
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = SpaceChampRWindow.new
window.show