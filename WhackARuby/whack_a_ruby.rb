require 'gosu'

class WhackARuby < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "whack the ruby!"
    @image = Gosu::Image.new('ruby.png')
    @x = 200
    @y = 200
    @width = 50
    @height = 43
    @velocity_x = 1
    @velocity_y = 1
    @visible = 0
  end

  def update
    @x += @velocity_x
    @y += @velocity_y

    @velocity_x *= -1 if @x + @width/2 >= 800 || @x - @width/2 <= 0
    @velocity_y *= -1 if @y + @height/2 >= 600 || @y - @height/2 <= 0

    @visible -= 1
    @visible = 30 if @visible < -10 && rand < 0.01
  end

  def draw
    if @visible > 0
      @image.draw(@x - @width / 2, @y - @height/2, 1)
    end
  end
end

window = WhackARuby.new
window.show
