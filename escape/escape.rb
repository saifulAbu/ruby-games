require 'gosu'
require 'chipmunk'

class Escape < Gosu::Window
	attr_reader :space

	def initialize
		super(800,800)
    self.caption = "Escape"
    @game_over = false
    @space = CP::Space.new
    @background = Gosu::Image.new('images/background.png', tileable: true)
  end

  def draw
    @background.draw(0, 0, 1)
  end
end

window = Escape.new
window.show
