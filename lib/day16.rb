# day16.rb
# define solutions for Day16
class Day16

  @@tickerTape = {'children'=> 3, 'cats'=> 7, 'samoyeds' => 2, 'pomeranians' => 3, 'akitas' => 0,
                  'vizslas' => 0, 'goldfish' => 5, 'trees' => 3, 'cars' => 2, 'perfumes' => 1}

  def self.solve1
    solve do |attr| hasSameValues(@@tickerTape, attr) && hasSameValues(attr, @@tickerTape) end
  end

  def self.solve2
    solve do |attr| satisfiesTicker(attr) && reverseTicker(attr) end
  end

  def self.solve(&block)
    readInput.each_with_index { |aunt|
      attr = parseSue aunt
      return attr['index'] if block.call(attr)
    }
  end

  def self.satisfiesTicker(attr)
    @@tickerTape.each_key { |key|
      next if key == 'index'
      case key
        when 'trees','cats'
          return false if attr.has_key?(key) && attr[key] <= @@tickerTape[key]
        when 'pomeranians','goldfish'
          return false if attr.has_key?(key) && attr[key] >= @@tickerTape[key]
        else
          return false if attr.has_key?(key) && attr[key] != @@tickerTape[key]
      end
    }
    true
  end

  def self.reverseTicker(attr)
    @@tickerTape.each_key { |key|
      case key
        when 'index','trees','cats','pomeranians','goldfish'
          next
        else
          return false if attr.has_key?(key) && attr[key] != @@tickerTape[key]
      end
    }
    true
  end

  def self.hasSameValues(attr1, attr2)
    attr1.each_key { |key|
      next if key == 'index'
      return false if attr2.has_key?(key) && attr1[key] != attr2[key]
    }
    true
  end

  def self.parseSue(sue)
                                            # Sue 1: goldfish: 9, cars: 0, samoyeds: 9
    index,gift1,qty1,gift2,qty2,gift3,qty3 = /\w+ (\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)/.match(sue).captures
    {'index' => index.to_i, gift1 => qty1.to_i, gift2 => qty2.to_i, gift3 => qty3.to_i}
  end

  def self.readInput
    File.readlines('lib/input/day16input.txt').map(&:chomp)
  end

end