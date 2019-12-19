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
    @velocity_x = 5
    @velocity_y = 5
  end

  def draw
    @image.draw(@x - @width / 2, @y - @height/2, 1)
  end

  def update
    @x += @velocity_x
    @y += @velocity_y
  end
end

window = WhackARuby.new
window.show
