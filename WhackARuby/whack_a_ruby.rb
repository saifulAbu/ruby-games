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
    @hammer_image = Gosu::Image.new('hammer.png')
    @hit = 0
    @font = Gosu::Font.new(30)
    @score = 0
    @playing = true
    @start_time = 0
  end

  def update
    if @playing
      @x += @velocity_x
      @y += @velocity_y

      @velocity_x *= -1 if @x + @width/2 >= 800 || @x - @width/2 <= 0
      @velocity_y *= -1 if @y + @height/2 >= 600 || @y - @height/2 <= 0
      @visible -= 1
      @visible = 30 if @visible < -10 && rand < 0.01
      @time_left = (100 - (Gosu.milliseconds - @start_time) / 1000)
      @playing = false if @time_left < 0
    end
  end

  def draw
    if @playing
      if @visible > 0
        @image.draw(@x - @width / 2, @y - @height/2, 1)
      end
      @hammer_image.draw(mouse_x , mouse_y, 1)
      if @hit == 0
        c = Gosu::Color::NONE
      elsif @hit == 1
        c = Gosu::Color::GREEN
      elsif @hit == -1
        c = Gosu::Color::RED
      end
      draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)
      @hit = 0
      @font.draw(@score.to_s, 700, 20, 2)
      @font.draw(@time_left.to_s, 20, 20, 2)
    end

    unless @playing
      @font.draw('Game Over', 300, 300, 3)
      @font.draw('Press the Space Bar to Play Again', 175, 350, 3)
      @visible = 20
    end
  end

  def button_down(id)
    if(id == Gosu::MsLeft)
      #if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
      if click_on_ruby?
        @hit = 1
        @score += 5
      else
        @hit = -1
        @score -= 1
      end
    else
      if (id == Gosu::KbSpace)
        @playing = true
        @visible = -10
        @start_time = Gosu.milliseconds
        @score = 0
      end
    end
  end

  def click_on_ruby?
    x1 = @x - @width/2
    y1 = @y - @height/2

    x2 = @x + @width/2
    y2 = @y + @height/2

    x = mouse_x + 50
    y = mouse_y + 23

    puts "mouse", x, y
    puts "image", x1, y1, x2, y2

    return true if (x > x1 && x < x2 && y > y1 && y < y2)
    return false
  end
end

window = WhackARuby.new
window.show
