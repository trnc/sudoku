require_relative 'problem_unifier'

class ProblemValidator
  attr_reader :problem
  private :problem

  def initialize(problem)
    @problem = problem
    @uniqueness_errors = []
  end

  def perform
    present?
    formatted?
    numbers_and_dots?
    unique_numbers_in_cell?
    unique_numbers_in_rows?
    unique_numbers_in_columns?
    true
  end

  private

  def present?
    fail 'Ohhh! Millions of decisions! Provide a problem.' if problem.nil?
  end

  def formatted?
    case problem
    when String then string_format
    when Array then array_format
    else fail 'I understand either string or array'
    end
  end

  def string_format
    fail 'String should contain exactly 81 chars' unless problem.length == 81
  end

  def array_format
    fail_msg = 'Oh no! Provide array with 9 by 9 format!'
    fail fail_msg unless problem.length == 9
    problem.each do |cell|
      fail fail_msg unless cell.length == 9
      cell.each do |record|
        fail fail_msg unless record.to_s.length == 1
      end
    end
  end

  def numbers_and_dots?
    fail_msg = 'Oh! I accept either 1-9 integers or dots'
    case problem
    when String
      fail fail_msg unless problem =~ /^[1-9\.]*$/
    when Array
      fail fail_msg unless problem.flatten.join =~ /^[1-9\.]*$/
    end
  end

  def unified_problem
    ProblemUnifier.new(problem).unify
  end

  def unique_numbers_in_cell?
    fail_msg = 'Do not cheat me! Non-unique numbers in cells detected!'
    unified_problem.each do |cell|
      numbs = cell.select { |r| r.is_a?(Integer) && r > 0 }
      fail fail_msg unless numbs.uniq.length == numbs.length
    end
  end

  def unique_numbers_in_rows?
    fail_msg = 'Oh, no! Non-unique numbers in rows detected!'
    unified_problem.each_slice(3) do |in_row_cells|
      3.times do |i|
        arr = []
        in_row_cells.each { |c| arr.push(c[i * 3..i * 3 + 2]) }
        arr = arr.flatten.select{ |a| a > 0 }
        fail fail_msg unless arr.uniq.length == arr.length
      end
    end
  end

  def unique_numbers_in_columns?
    fail_msg = 'Attention! Non-unique numbers in columns detected!'
    3.times do |i|
      3.times do |n|
        column = []
        [0,3,6].each do |j|
          [0,3,6].each do |k|
            column.push(unified_problem[i + j][n + k])
          end
        end
        column.select!{ |a| a > 0 }
        fail fail_msg unless column.uniq.length == column.length
      end
    end
  end
end
