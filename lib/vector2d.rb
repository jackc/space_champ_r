class Vector2d
  attr_reader :x, :y
  alias_method :width, :x
  alias_method :height, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def +(other)
    self.class.new x + other.x, y + other.y
  end

  def *(scalar)
    self.class.new x * scalar, y * scalar
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def wrap(bound)
    self.class.new wrap_scalar(x, bound.width), wrap_scalar(y, bound.width)
  end

  def inspect
    "<Vector2d(#{x}, #{y})"
  end

  private

  def wrap_scalar(scalar, bound)
    if scalar < 0
      bound + scalar
    elsif scalar > bound
      scalar % bound
    else
      scalar
    end
  end
end

def Vector2d(x, y)
  Vector2d.new(x, y)
end