require 'spec_helper'
require './lib/game_of_life'

describe GameOfLife do
  it 'does whats expected' do
    seed = [[0, 1, 0], [0, 0, 1], [1, 1, 1], [0, 0, 0]]
    game = GameOfLife.new seed

    final_gen = game.play

    expected_output = [[0, 0, 0], [1, 0, 1], [0, 1, 1], [0, 1, 0]]
    expect(final_gen).to eql expected_output
  end

  it 'does whats expected again' do
    seed = [[1, 1], [1, 0]]
    game = GameOfLife.new seed

    final_gen = game.play

    expected_output = [[1, 1], [1, 1]]
    expect(final_gen).to eql expected_output
  end
end
