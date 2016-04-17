# day02.rb
# define solutions for Day02
class Day02
  def self.solve1
    lines = readInput
    lines.reduce(0) {|sum, dims| sum + ((3 * dims[0] * dims[1]) + (2 * dims[1] * dims[2]) + (2 * dims[0] * dims[2]))}
  end

  def self.solve2
    lines = readInput
    lines.reduce(0) {|sum, dims| sum + ((2 * dims[0]) + (2 * dims[1]) + (dims[0] * dims[1] * dims[2]))}
  end

  def self.readInput
    File.readlines('lib/input/day02input.txt').map {|x| x.chomp.split("x").map(&:to_i).sort }
  end
end