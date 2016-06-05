# day12.rb
# define solutions for Day12
require 'json'
class Day12

  def self.solve1
    readInput.scan(/[-\d]+/).map(&:to_i).inject(0) { |sum,val| sum += val }
  end

  def self.solve2
    sumHash(JSON.parse(readInput))
  end

  def self.sumArray(json)
    total = 0
    json.each { |elem|
      case elem
        when String
          # do nothing
        when Hash
          total += sumHash(elem)
        when Integer
          total += elem.to_i
        else
          total += sumArray(elem)
      end
    }
    total
  end

  def self.sumHash(json)
    total = 0
    json.each do |k, v|
      case v
        when String
          return 0 if 'red' == v
        when Hash
          total += sumHash(v)
        when Integer
          total += v.to_i
        else
          total += sumArray(v)
      end
    end
    total
  end

  def self.readInput
    lines = File.readlines('lib/input/day12input.txt')[0] # only 1 line
  end
end