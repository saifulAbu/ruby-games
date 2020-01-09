require_relative 'square'

class Game
  def initialize(window)
    @window = window
    @squares = []
    color_list = []
    [:red, :green, :blue].each do |color|
      12.times do
        color_list.push color
      end
    end
    color_list.shuffle!
    (0..5).each do |row|
      (0..5).each do |column|
        index = row * 6 + column
        @squares.push Square.new(@window, column, row, color_list[index])
      end
    end
    @font = Gosu::Font.new(36)
  end

  def draw
    @squares.each do |square|
      square.draw
    end
  end

  def handle_mouse_down(x, y)
    row = (y.to_i - 20) / 100
    column = (x.to_i - 20) / 100
    @start_square = get_square(column, row)
  end

  def get_square(column, row)
    if column < 0 or column > 5 or row < 0 or row > 5
      return nil
    else
      return @squares[row * 6 + column]
    end
  end
end


