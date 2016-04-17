# day01.rb
# define solutions for Day01
class Day01
  def self.solve1
    line = readInput
    line.count('(') - line.count(')')
  end

  def self.solve2
    line = readInput
    floor = 0
    answer = -1
    line.split("").each_with_index do |c, i|
      floor += (c == '(') ? 1 : -1
      answer = i + 1
      break if floor == -1
    end
    answer
  end

  def self.readInput
    File.readlines('lib/input/day01input.txt')[0]
  end
end