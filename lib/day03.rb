# day03.rb
# define solutions for Day03
require 'set'
class Day03
  def self.solve1
    santa = followDirections(readInput)
    santa.size
  end

  def self.solve2
    left,right = readInput.partition.each_with_index{ |el, i| i.even? }
    santa = followDirections(left)
    robot = followDirections(right)
    (santa | robot).size
  end

  def self.followDirections(directions)
    visitedHouses = Set.new
    (x, y) = [0, 0]
    deliverPresent(visitedHouses, x, y)
    directions.each do |ch|
      y += 1 if ch == '^'
      y -= 1 if ch == 'v'
      x += 1 if ch == '>'
      x -= 1 if ch == '<'
      (x, y) = deliverPresent(visitedHouses, x, y)
    end
    visitedHouses
  end

  def self.deliverPresent(visitedHouses, x, y)
    at = [x, y]
    visitedHouses << at
    at
  end

  def self.readInput
    File.readlines('lib/input/day03input.txt')[0].split("")
  end
end