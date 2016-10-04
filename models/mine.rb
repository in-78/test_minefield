class Mine

  attr_reader :x, :y, :radius

  # @param [Float] x
  # @param [Float] y
  # @param [Float] radius
  def initialize(x, y, radius)
    @x = x
    @y = y
    @radius = radius
  end

  def to_s
    "(#{x}, #{y}, #{radius})"
  end

  # @param [Array<Mine>] mines
  # @return [Boolean]
  def explodable?(mines)
    mines.any?{ |m| m.explodes?(self) }
  end

  protected

  # @param [Mine] mine
  # @return [Boolean]
  def explodes?(mine)
    distance = Math::sqrt((@x - mine.x)**2 + (@y - mine.y)**2)
    distance <= radius
  end

end
