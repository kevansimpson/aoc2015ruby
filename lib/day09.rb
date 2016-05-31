# day09.rb
# define solutions for Day09
class Day09

  @@jumpDistanceMap = {}
  @@distanceMap = {}
  @@locations = Set.new

  def self.solve1
    logDistances readInput#.reduce(0) { |sum, w| sum += (w.length - eval(w).length)}
    locationList = @@locations.to_a
    buildAllPaths(locationList, []);
    @@distanceMap.group_by(&:last).min_by(&:first).last[0][1]
  end

  def self.solve2
    @@distanceMap.group_by(&:last).max_by(&:first).last[0][1]
  end

  def self.buildAllPaths(available, perm)
    if available.length == 0
      @@distanceMap[perm] = calculateDistance(perm)
    else
      available.each_with_index { |location, ix |
        remaining = available + []
        remaining.delete_at ix
        newPerm = perm + []
        newPerm << location
        buildAllPaths remaining, newPerm
      }
    end
  end

  def self.calculateDistance(perm)
    dist = 0
    perm.each_with_index { |location,ix|
      dist += (ix + 1) == perm.length ? 0 : @@jumpDistanceMap[[perm[ix], perm[ix + 1]]]
    }
    dist
  end

  def self.logDistances(lines)
    lines.each { |instruction|
      a,b,dist = /(.+) to (.+) = (\d+)/.match(instruction).captures
      @@jumpDistanceMap[[a,b]] = dist.to_i
      @@jumpDistanceMap[[b,a]] = dist.to_i
      @@locations << a
      @@locations << b
    }
  end
  def self.readInput
    lines = File.readlines('lib/input/day09input.txt').map(&:chomp)#.map {|x| x.chomp }
  end
end