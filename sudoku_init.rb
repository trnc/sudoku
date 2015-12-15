require_relative 'solver/problem_validator'
require_relative 'solver/problem_unifier'

class SudokuInitializer
  def initialize(problem = nil)
    @problem = problem if problem_valid?(problem)
  end

  private

  def validate_params(problem)
    ProblemValidator.new(problem).perform
  end
end
