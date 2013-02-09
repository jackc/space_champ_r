$LOAD_PATH.push File.expand_path('../../vendor', __FILE__)

require 'java'
require 'lwjgl.jar'
require 'slick.jar'

java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.AppGameContainer

class SpaceChampR < BasicGame
  def render(container, graphics)
    graphics.draw_string('Space Champ R (ESC to exit)', 8, container.height - 30)
  end

  def init(container)
  end

  def update(container, delta)
    input = container.get_input
    container.exit if input.is_key_down(Input::KEY_ESCAPE)
  end
end

app = AppGameContainer.new(SpaceChampR.new('Space Champ R'))
app.set_display_mode(640, 480, false)
app.start
