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
end

window = Twelve.new
window.show