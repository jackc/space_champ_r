require 'gosu'

class SpaceChampRWindow < Gosu::Window
  def initialize
   super(640, 480, false)
   self.caption = 'Space Champ R'
   @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
  end

  def draw
    @font.draw "Space Champ R (ESC to exit)", 10, 10, 1
    @font.draw Time.now.strftime('%m/%d/%Y %I:%M:%S %p'), 10, 50, 1
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = SpaceChampRWindow.new
window.show