class SudokuInitializer
  def initialize(problem = nil)
    validate_params(problem)
    @problem = problem
  end

  def problem
  end

  private

  def validate_params(problem)
    fail 'Ohhh! Millions of decisions! Provide a problem.' if problem.nil?
  end
end
