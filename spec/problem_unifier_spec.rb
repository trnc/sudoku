require 'spec_helper'

describe ProblemUnifier do
  let(:input_arr) do
    [].tap do |arr|
      9.times { |n| arr.push(('.' * 8).split('').push(n + 1)) }
    end
  end
  let(:output_arr) do
    [].tap do |arr|
      9.times { |n| arr.push(([0] * 8).push(n + 1)) }
    end
  end

  it 'will convet dots to zeros' do
    expect(ProblemUnifier.new(input_arr).unify).to eq output_arr
  end

  it 'will convert string to 9 by 9 dimension array', t: true do
    str = ''
    9.times { |n| str += '.' * 8 + "#{n + 1}" }
    expect(ProblemUnifier.new(str).unify).to eq output_arr
  end
end
