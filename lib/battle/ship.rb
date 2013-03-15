require 'vector2d'

module Battle
  class Ship
    attr_reader :position
    attr_reader :velocity
    attr_reader :direction
    attr_reader :renderer
    attr_reader :controller

    def initialize(renderer: nil, position: Vector2d.new(0,0), direction: Vector2d.new(0,0), controller: nil)
      @position = position
      @velocity = Vector2d.new(0,0)
      @direction = direction
      @renderer = renderer
      @controller = controller
    end

    def update
      # @position += Vector2d.new(0, 1) if controller.thrust?
      @direction -= 0.1 if controller.left?
      @direction += 0.1 if controller.right?
      @direction += (Math::PI * 2) while @direction < 0
      @direction -= (Math::PI * 2) while (Math::PI * 2) <= @direction

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
      renderer.draw(self)
    end
  end
end