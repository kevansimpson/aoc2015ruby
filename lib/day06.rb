# day06.rb
# define solutions for Day06
class Day06

  def self.solve1
    # takes ~7sec
    solveWithArray 1 do |pos_value, modifier|
      modifier > -1 ? modifier : (pos_value == 1 ? 0 : 1)
    end
    # takes ~30sec
    # solveWithHash
  end

  def self.solve2
    solveWithArray 2 do |pos_value, modifier|
      [pos_value + modifier, 0].max
    end
  end

  def self.solveWithArray(challenge, &block)
    grid = Array.new(1000) { Array.new(1000, 0) }

    readInput.each { |line|
      x1,y1,x2,y2 = line.scan(/\d+/).map(&:to_i)

      modifier = determineModifier(line, challenge)

      for x in x1..x2
        for y in y1..y2
          grid[x][y] = block.call(grid[x][y], modifier)
        end
      end
    }

    grid.map { |light_row| light_row.inject(&:+) }.inject(&:+)
  end

  def self.determineModifier(line, challenge)
    if line.start_with?("turn on")
      1
    elsif line.start_with?("turn off")
      challenge == 1 ? 0 : -1
    else # toggle
      challenge == 1 ? -1 : 2
    end
  end

  def self.solveWithHash
    lights = Hash.new(0)

    readInput.each { |line|
      x1,y1,x2,y2 = line.scan(/\d+/).map(&:to_i)

      if line.start_with? 'turn on'
        flip x1, x2, y1, y2 do |x, y|
          lights[uuid(x, y)] = 1
        end
      elsif line.start_with? 'turn off'
        flip x1, x2, y1, y2 do |x, y|
          next if lights[uuid(x, y)] == 0
          lights[uuid(x, y)] = 0
        end
      else
        flip x1, x2, y1, y2 do |x, y|
          key = uuid(x,y)
          if lights[key] == 0
            lights[key] = 1
          else
            lights[key] = 0
          end
        end
      end
    }

    p lights.inject(0) { |sum, tuple| sum += tuple[1] }
  end

  def self.uuid(x, y)
    "[#{x},#{y}]"
  end

  def self.flip(x1, x2, y1, y2, &block)
    (x1..x2).each do |x|
      (y1..y2).each do |y|
        block.call(x, y)
      end
    end
  end

  def self.readInput
    File.readlines('lib/input/day06input.txt').map {|x| x.chomp }
  end
end