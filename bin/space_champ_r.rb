require 'bundler'
Bundler.setup(:default)

require 'gosu'

$LOAD_PATH.unshift File.expand_path(File.join(__dir__, '..', 'lib'))
require 'vector2d'
require 'battle'

class SpaceChampRWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'Space Champ R'
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @image = Gosu::Image.new self, 'resources/images/cruiser.bmp'
    @ship_sprite = Gosu::Image.load_tiles self, 'resources/images/cruiser.bmp', 96, 96, false
    @player_controller = Battle::PlayerController.new self
    @ship = Battle::Ship.new renderer: Battle::ShipRenderer.new(@ship_sprite),
      position: Vector2d.new(0, 0),
      direction: 0,
      controller: @player_controller
  end

  def update
    @ship.update
  end

  def draw
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