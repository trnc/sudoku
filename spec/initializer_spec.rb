require 'spec_helper'

describe SudokuInitializer do
  let(:invalid_arr)  { [1,2,3] }
  let(:valid_arr) { [1,2,3,4,5,6,7,8,9] }

  it 'will raise error if problem is not provided' do
    expect{ SudokuInitializer.new }.to raise_error /provide a problem/i
  end

  # it 'stores an array of problem as a parameter' do
  #   sudoku = SudokuInitializer.new(arr)
  #   expect(sudoku.instance_eval{ @problem }).to eq arr
  # end
  #
  # it 'will raise error if array is not 9by9 format' do
  # end

  # it 'will raise error is cells has the same numbers' do
  # end
  #
  # it 'will raise error if rows has the same numbers' do
  # end
  #
  # it 'will raise error if columns has same numbers' do
  # end
end
