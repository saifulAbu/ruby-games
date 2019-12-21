class Player
  def initialize(window)
    @x = 200
    @y = 200
    @angle = 0
    @image = Gosu::Image.new('images/ship.png')
  end

  def turn_right
    @angle += 3
  end

  def turn_left
    @angle -= 3
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end