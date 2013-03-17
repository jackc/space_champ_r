class Vector2d
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def +(other)
    self.class.new x + other.x, y + other.y
  end

  def *(scalar)
    self.class.new x * scalar, y * scalar
  end
end

def Vector2d(x, y)
  Vector2d.new(x, y)
end