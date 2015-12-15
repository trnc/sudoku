require_relative 'solver/problem_validation'

class SudokuInitializer
  def initialize(problem = nil)
    validate_params(problem)
    @problem = problem
  end

  def problem
  end

  private

  def validate_params(problem)
    ProblemValidation.new(problem).perform
  end
end
