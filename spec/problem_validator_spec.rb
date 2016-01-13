require 'spec_helper'

describe ProblemValidator do
  it 'should be initialized with one argument' do
    expect { ProblemValidator.new(nil) }.to_not raise_error
  end

  it 'should contain only one public method to perform validation' do
    expect(ProblemValidator.public_instance_methods(false).length)
      .to eq 1
  end

  describe 'will allow' do
    it 'string as 81 length with numbers and dots' do
      str = '.' * 80 + '1'
      expect(ProblemValidator.new(str).perform).to eq true
    end

    it 'array as 9 by 9 formatted with number and dots' do
      expect(ProblemValidator.new(arr).perform).to eq true
    end
  end

  describe 'will raise error' do
    it 'if problem is not provided' do
      expect{ ProblemValidator.new(nil).perform }
        .to raise_error /provide a problem/i
    end

    it 'if array is not 9by9 format' do
      bad = [1,2,3]
      expect{ ProblemValidator.new(bad).perform }
        .to raise_error /9 by 9/i
    end

    it 'if not an array or string passed' do
      [1, false].each do |el|
        expect{ ProblemValidator.new(el).perform }
          .to raise_error /either string or array/i
      end
    end

    it 'if it contains elements beyond 1-9 range and dots' do
      [0, 's', ','].each do |bad_val|
        bad_arr = arr
        bad_arr[0][0] = bad_val
        bad_str = '.' * 80 + bad_val.to_s
        [bad_arr, bad_str].each do |bad_input|
          expect{ ProblemValidator.new(bad_input).perform }
            .to raise_error /either 1-9 integers or dots/i
        end
      end
    end

    it 'if cells has non-unique numbers' do
      bad_arr = arr
      bad_arr[0][0] = bad_arr[0][1] = 1
      expect{ ProblemValidator.new(bad_arr).perform }
        .to raise_error /non-unique numbers in cells/i
    end

    it 'if rows has non-unique numbers' do
      bad_arr_1 = arr
      bad_arr_1[0][0] = bad_arr_1[1][1] = 5
      bad_arr_2 = arr
      bad_arr_2[3][5] = bad_arr_2[4][3] = 9
      bad_arr_3 = arr
      bad_arr_3[6][0] = bad_arr_3[8][1] = 1
      [bad_arr_1, bad_arr_2, bad_arr_3].each do |bad_arr|
        expect{ ProblemValidator.new(bad_arr).perform }
          .to raise_error /non-unique numbers in rows/i
      end
    end

    it 'if columns has non-unique numbers', f: true do
      bad_arr_1 = arr
      bad_arr_1[0][0] = bad_arr_1[3][6] = 3
      bad_arr_2 = arr
      bad_arr_2[4][1] = bad_arr_2[7][7] = 2
      bad_arr_3 = arr
      bad_arr_3[2][5] = bad_arr_3[8][8] = 1
      [bad_arr_1, bad_arr_2, bad_arr_3].each do |bad_arr|
        expect{ ProblemValidator.new(bad_arr).perform }
          .to raise_error /non-unique numbers in columns/i
      end
    end
  end
end
