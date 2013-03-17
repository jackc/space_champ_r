require 'vector2d'

module Battle
  class Arena
    attr_reader :size
    attr_reader :ships

    def initialize(
      size: Vector2d(640*5, 480*5)
    )
      @size = size
      @ships = []
    end

    def update
      ships.each(&:update)
    end
  end
end