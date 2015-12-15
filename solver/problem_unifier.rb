class ProblemUnifier
  attr_reader :problem
  private :problem

  def initialize(problem)
    @problem = problem
  end

  def unify
    problem.is_a?(Array) ? problem : from_string
  end

  private

  def from_string
    [].tap do |arr|
      problem.split('').each_slice(9) { |slc| arr.push(slc) }
    end
  end
end
