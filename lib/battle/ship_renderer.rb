module Battle
  class ShipRenderer
    attr_reader :images

    def initialize(images)
      @images = images
    end

    def draw(ship)
      current_image(ship.direction).draw ship.position.x, ship.position.y, 0
    end

    private

    def current_image(direction)
      index = (image_count / (Math::PI * 2) * direction).to_i
      images[index]
    end

    def image_count
      64
    end
  end
end