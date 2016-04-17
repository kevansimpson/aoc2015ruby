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
    line.split("").each_with_index do |c, i|
      floor += (c == '(') ? 1 : -1
      return i + 1 if floor == -1
    end
  end

  def self.readInput
    File.readlines('lib/input/day01input.txt')[0]
  end
end