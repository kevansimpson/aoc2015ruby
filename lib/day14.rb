# day14.rb
# define solutions for Day14
class Day14

  @@speedMap = {}

  def self.solve1
    logDistances readInput
    identifyWinners(2503)[0]
  end

  def self.solve2
    winner = runForPoints 2504
    winner[1]
  end

  def self.identifyWinners(seconds)
    distances = runRace seconds
    distances.max_by(&:first)
  end

  def self.runRace(seconds)
    distances = {}
    @@speedMap.each {|name, sdr|
      dist = calculateHowFar sdr, seconds
      if distances.has_key? dist
        distances[dist].push(name)
      else
        distances[dist] = [name]
      end
    }
    distances
  end

  def self.runForPoints(seconds)
    points = Hash.new(0)
    (1..seconds).each do | ix |
      winners = identifyWinners ix
      winners[1].each { |reindeer| points[reindeer] +=1 }
    end
    points.max_by{|k,v| v}
  end

  def self.calculateHowFar(sdr, seconds)
    totalTime = sdr["d"] + sdr["r"]
    ((seconds / totalTime) * sdr["d"] * sdr["s"] + [(seconds % totalTime), sdr["d"]].min * sdr["s"])
  end

  def self.logDistances(lines)
    lines.each { |instruction|
      # Rudolph can fly 22 km/s for 8 seconds, but then must rest for 165 seconds.
      reindeer,speed,duration,rest = /(\w+).+fly (\d+) km\/s for (\d+).+for (\d+) seconds./.match(instruction).captures
      # @@jumpDistanceMap[reindeer] = [speed.to_i,duration.to_i,rest.to_i]
      @@speedMap[reindeer] = {"s" => speed.to_i, "d" => duration.to_i, "r" => rest.to_i}
    }
  end

  def self.readInput
    File.readlines('lib/input/day14input.txt').map(&:chomp)
  end
end