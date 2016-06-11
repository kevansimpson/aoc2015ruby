# day13.rb
# define solutions for Day13
class Day13

  @@ME = 'ME'
  @@jumpDistanceMap = {}
  @@distanceMap = {}
  @@people = Set.new

  def self.solve1
    logDistances readInput
    buildAllPaths(@@people.to_a, [])
    @@distanceMap.group_by(&:last).max_by(&:first).last[0][1]
  end

  def self.solve2
    @@people << @@ME
    @@distanceMap = {}
    buildAllPaths(@@people.to_a, [])
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
    last = perm.length - 2
    dist = getDelta(perm[last + 1], perm[0])
    dist += getDelta(perm[0], perm[last + 1])
    # puts perm.to_s
    (0..last).each do | ix |
        # puts ix.to_s
        # puts perm[ix]
        # puts perm[ix + 1]
        dist += getDelta(perm[ix], perm[ix + 1])
        dist += getDelta(perm[ix + 1], perm[ix])
    end
    dist
  end

  def self.getDelta(p1, p2)
    p1 == @@ME || p2 == @@ME ? 0 : @@jumpDistanceMap[[p1,p2]]
  end

  def self.logDistances(lines)
    lines.each { |instruction|
      p1,gainLose,dist,p2 = /(\w+) \w+ (gain|lose) (\d+).+to (\w+)\./.match(instruction).captures
      @@jumpDistanceMap[[p1,p2]] = dist.to_i * ('gain' == gainLose ? 1 : -1)
      @@people << p1
      @@people << p2
    }
  end

  def self.readInput
    File.readlines('lib/input/day13input.txt').map(&:chomp)
  end
end