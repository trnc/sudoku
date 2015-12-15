require 'spec_helper'

describe SudokuInitializer do
  let(:arr) { [1,2,3] }
  it 'can initialize new game' do
    expect(SudokuInitializer.new(arr)).to be_an_instance_of SudokuInitializer
  end
  it 'accepts an array of problem as a parameter' do
    sudoku = SudokuInitializer.new(arr) 
    expect(sudoku.instance_eval{ @problem }).to eq arr
  end
end
