# day05.rb
# define solutions for Day05
class Day05
  def self.solve1
    readInput.count { |x| x.scan(/[aeiou]/).size >= 3 && x.scan(/([a-z])\1+/).size >= 1 && x.scan(/(ab|cd|pq|xy)/).size <= 0 }
  end

  def self.solve2
    readInput.count { |x| x.scan(/([a-z]{2}).*\1+/).size >= 1 && x.scan(/([a-z]).\1+/).size >= 1 }
  end

  def self.readInput
    File.readlines('lib/input/day05input.txt').map {|x| x.chomp }
  end
end