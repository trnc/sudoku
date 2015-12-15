require 'spec_helper'

describe ProblemUnifier do
  let(:arr) do
    [].tap do |arr|
      9.times { |n| arr.push(('.' * 8 + "#{n + 1}").split('')) }
    end
  end

  it 'will return the same array passed' do
    expect(ProblemUnifier.new(arr).unify).to eq arr
  end

  it 'will convert string to 9 by 9 dimension array' do
    str = ''
    9.times { |n| str += '.' * 8 + "#{n + 1}" }
    expect(ProblemUnifier.new(str).unify).to eq arr
  end
end
