require_relative 'problem_unifier'

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
    else fail 'I understand either string or array'
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

  def numbers_and_dots?
    fail_message = 'Oh! I accept either 1-9 integers or dots'
    unf_arr = ProblemUnifier.new(problem).unify

    unf_arr.each do |cell|
      cell.each do |el|
        fail fail_message unless el.to_s =~ /^[1-9\.]/
      end
    end
  end

  # def unique_numbers_in_cell?
  #   fail 'Do not cheat me! Non-unique numbers in cells detected!'
  #   problem.each do |cell|
  # end
end
