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

  def squares_between_in_row(square1, square2)
    the_squares = []
    if squares.column < square2.column
      column_start, column_end = square1.column, square2.column
    else
      column_start, column_end = square2.column, square1.column
    end
    (column_start .. column_end).each do |column|
      the_squares.push get_square(column, square1.row)
    end
    return the_squares
  end

  def squares_between_in_column(square1, square2)
    the_squares = []
    if square1.row < square2.row
      row_start, row_end = square1.row, square2.row
    else
      row_start, row_end = square2.row, square1.row
    end
    (row_start .. row_end).each do |row|
      the_squares.push get_square(square1.column, row)
    end
    return the_squares
  end
end


