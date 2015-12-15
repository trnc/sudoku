class ProblemValidator
  attr_reader :problem
  private :problem

  def initialize(problem)
    @problem = problem
    @uniqueness_errors = []
  end

  def perform
    is_present?
    true
    # formatted?
    # unique_numbers_in_cell?
    # unique_numbers_in_rows?
    # unique_numbers_in_columns?
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
  end
end
    #
