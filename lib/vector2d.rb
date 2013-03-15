class Vector2d
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def +(other)
    Vector2d.new x + other.x, y + other.y
  end
end

def Vector2d(x, y)
  Vector2d.new(x, y)
end