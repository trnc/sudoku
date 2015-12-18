require 'spec_helper'

describe ProblemValidator do
  let(:arr) do
    [].tap do |arr|
      9.times { |n| arr.push(('.' * 8).split('').push(n + 1)) }
    end
  end

  it 'should be initialized with one argument' do
    expect { ProblemValidator.new(nil) }.to_not raise_error
  end

  it 'should contain only one public method to perform validation' do
    expect(ProblemValidator.public_instance_methods(false).length)
      .to eq 1
  end

  describe 'it will allow' do
    it 'string as 81 length with numbers and dots', f:true do
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
      [0, 12, 's', ','].each do |bad_val|
        bad_arr = arr.dup
        bad_arr[0][0] = bad_val
        expect{ ProblemValidator.new(bad_arr).perform }
          .to raise_error /either 1-9 integers or dots/i
      end
    end

    it 'will raise error is cells has the same numbers' do
      bad_arr = arr.dup
      bad_arr[0][0] = bad_arr[0][1] = 1
      expect{ ProblemValidator.new(bad_arr).perform }
        .to raise_error /non-unique numbers in cells/i
    end
    #
    # it 'will raise error if rows has the same numbers' do
    # end
    #
    # it 'will raise error if columns has same numbers' do
    # end
  end
end
