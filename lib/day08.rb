# day08.rb
# define solutions for Day08
class Day08

  def self.solve1
    readInput.reduce(0) { |sum, w| sum += (w.length - eval(w).length)}
  end

  def self.solve2
    readInput.reduce(0) { |sum, w| sum += (w.inspect.length - w.length)}
  end

  def self.readInput
    lines = File.readlines('lib/input/day08input.txt').map(&:chomp)#.map {|x| x.chomp }
  end
end