require_relative '../sudoku_init'


def arr
  [].tap { |arr| 9.times { |n| arr.push(('.' * 8).split('').push(n + 1)) } }
end
