class ProblemValidator
  attr_reader :problem
  private :problem

  def initialize(problem)
    @problem = problem
    @uniqueness_errors = []
  end

  def perform
    is_present?
    formatted?
    numbers_and_dots?
    # unique_numbers_in_cell?
    # unique_numbers_in_rows?
    # unique_numbers_in_columns?
    true
  end

  private

  def is_present?
    fail 'Ohhh! Millions of decisions! Provide a problem.' if problem.nil?
  end

  def formatted?
    case problem
    when Array then array_format
    when String then string_format
    else fail 'I understand only strings and arrays'
    end
  end

  def string_format
    fail 'String should contain exactly 81 chars' unless problem.length == 81
  end

  def array_format
    fail_message = 'Oh no! Provide array with 9 by 9 format!'
    fail fail_message if problem.length != 9
    problem.each do |cell|
      fail fail_message if cell.length != 9
    end
  end

  def numbers_and_dots
    UnifiedProblem.new(problem).unify
    fail 'Oh! I accept only 1-9 integers and dots'
  end
end
