class ProblemUnifier
  attr_reader :problem
  private :problem

  def initialize(problem)
    @problem = problem
  end

  def unify
    dots_to_zeros
  end

  private

  def dots_to_zeros
    problem2arr = problem.is_a?(Array) ? problem : from_string
    problem2arr.each { |cell| cell.map! { |el| el.to_i  } }
  end

  def from_string
    [].tap do |arr|
      problem.split('').each_slice(9) { |slc| arr.push(slc) }
    end
  end
end
