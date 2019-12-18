require 'gosu'

class WhackARuby < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "whack the ruby!"
  end
end

window = WhackARuby.new
window.show
