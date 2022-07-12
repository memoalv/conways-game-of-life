class GameOfLife
  def initialize(board)
    @bounds = board.size
    @board = increment_boards_bounds_with_nils board
  end

  def play
    new_gen_board = initialize_new_generation_board

    @board.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        next if cell.nil?

        alive_neighbors = amount_of_alive_neighbors_for(x, y)
        cell_is_alive = cell.positive?

        new_gen_board[x][y] = if cell_is_alive && [2, 3].include?(alive_neighbors)
                                # cell keeps living
                                1
                              elsif !cell_is_alive && alive_neighbors == 3
                                # cell revives
                                1
                              else
                                # cell dies
                                0
                              end
      end
    end
  end

  def amount_of_alive_neighbors_for(cell_x, cell_y)
    find_neighbors_of(cell_x, cell_y).count do |neighboring_cell|
      neighbors_x, neighbors_y = neighboring_cell

      value = @board[neighbors_x][neighbors_y]

      !value.nil? && value.positive?
    end
  end

  def find_neighbors_of(cell_x, cell_y)
    neighbors = []

    # top left
    neighbors << [cell_x - 1, cell_y - 1]
    # top
    neighbors << [cell_x - 1, cell_y]
    # top right
    neighbors << [cell_x - 1, cell_y + 1]
    # right
    neighbors << [cell_x, cell_y + 1]
    # bottom right
    neighbors << [cell_x + 1, cell_y + 1]
    # bottom
    neighbors << [cell_x + 1, cell_y]
    # bottom left
    neighbors << [cell_x + 1, cell_y - 1]
    # left
    neighbors << [cell_x, cell_y - 1]

    neighbors
  end

  def increment_boards_bounds_with_nils(board)
    board.unshift Array.new(@bounds, nil)
    board << Array.new(@bounds, nil)

    board.map do |arr|
      arr.unshift nil
      arr << nil
    end
  end

  def initialize_new_generation_board
    new_board = []

    1..@bounds.times do
      new_board << Array.new(3, 0)
    end

    increment_boards_bounds_with_nils new_board
  end
end

p GameOfLife.new([[0, 1, 0], [1, 1, 0], [0, 0, 0]]).play
