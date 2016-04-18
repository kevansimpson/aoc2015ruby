# day03.rb
# define solutions for Day03
require 'set'
class Day03
  def self.solve1
    santa = followDirections(readInput.split(""))
    santa.size
  end

  def self.solve2
    left,right = readInput.split("").partition.each_with_index{ |el, i| i.even? }
    santa = followDirections(left)
    robot = followDirections(right)
    (santa | robot).size
  end

  def self.followDirections(directions)
    visitedHouses = Set.new
    (x, y) = [0, 0]
    deliverPresent(visitedHouses, x, y)
    directions.each do |ch|
      case ch
        when '^'
          (x, y) = deliverPresent(visitedHouses, x, 1 + y)
        when 'v'
          (x, y) = deliverPresent(visitedHouses, x, y - 1)
        when '<'
          (x, y) = deliverPresent(visitedHouses, x - 1, y)
        when '>'
          (x, y) = deliverPresent(visitedHouses, 1 + x, y)
      end
    end
    visitedHouses
  end

  def self.deliverPresent(visitedHouses, x, y)
    at = [x, y]
    visitedHouses << at
    at
  end

  def self.readInput
    File.readlines('lib/input/day03input.txt')[0] #.map {|x| x.chomp.split("x").map(&:to_i).sort }
  end
end