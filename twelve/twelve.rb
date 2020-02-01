require 'gosu'
require_relative 'game'

class Twelve < Gosu::Window
  def initialize
    super(640, 640)
    self.caption = "twelve"
    @game = Game.new(self)
  end

  def draw
    @game.draw
  end

  def needs_cursor?
    true
  end

  def button_down(id)
    if id == Gosu::MsLeft
      @game.handle_mouse_down(mouse_x, mouse_y)
    end

    if id == Gosu::KbR && button_down?(Gosu::KbLeftControl)
      @game = Game.new(self)
    end
  end

  def button_up(id)
    if id == Gosu::MsLeft
      @game.handle_mouse_up(mouse_x, mouse_y)
    end
  end

  def handle_mouse_up(x, y)
    row = (y.to_i - 20) / 100
    column = (x.to_i - 20) / 100
    @end_square = get_square(column, row)
    if @start_queue and @end_square
      move(@start_queue, @end_square)
    end
    @start_square = nil
  end
end

window = Twelve.new
window.show
