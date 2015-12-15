require 'spec_helper'

describe ProblemValidator do
  it 'should be initialized with one argument' do
    expect { ProblemValidator.new(nil) }.to_not raise_error
  end

  it 'should contain only one public method to perform validation' do
    expect(ProblemValidator.public_instance_methods(false).length)
      .to eq 1
  end

  describe 'it will allow' do
    it 'string as 81 length with numbers and dots' do
      str = '.' * 80 + '1'
      expect(ProblemValidator.new(str).perform).to eq true
    end
    #
    # it 'array as 9 by 9 formats with number and dots' do
    #
    # end
  end

  describe 'will raise error' do
    it 'if problem is not provided' do
      expect{ ProblemValidator.new(nil).perform }
        .to raise_error /provide a problem/i
    end

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
end
