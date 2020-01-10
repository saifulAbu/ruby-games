require 'gosu'

class LightningTalk < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "Lightning Talk!"
    @image = Gosu::Image.new('ruby.png')
    @x = 0
    @y = 0
    @velocity_x = 1
    @velocity_y = 1
  end

  def update
    @x += @velocity_x
    @y += @velocity_y
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def button_down(id)
    if id == Gosu::KbLeft
      @x -= 5
    elsif id == Gosu::KbRight
      @x += 5
    elsif id == Gosu::KbUp
      @y -= 5
    else
      @y += 5
    end
  end
end

window = LightningTalk.new
window.show
