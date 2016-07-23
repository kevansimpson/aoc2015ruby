# day18.rb
# define solutions for Day18
class Day18

  @@SIZE = 100

  def self.solve1
    solve false
  end

  def self.solve2
    solve true
  end

  def self.solve(hasBrokenCornerLights)
    grid = loadGrid readInput
    breakCornerLights grid if hasBrokenCornerLights
    100.times do grid = click(grid, hasBrokenCornerLights) end
    countLights grid
  end

  def self.show(grid)
    grid.each { |row| puts "#{(row.map{ |e| e ? '#' : '_' }).join}\n" }
  end

  def self.click(grid, hasBrokenCornerLights)
    nextGrid = Array.new(@@SIZE) { Array.new(@@SIZE, false) }
    grid.each_with_index { |row,y|
      row.each_with_index { |isOn,x|
        neighborsOn = countNeighbors(grid, x, y)
        nextGrid[y][x] = isOn ? (neighborsOn == 2 || neighborsOn == 3) : neighborsOn == 3
      }
    }

    hasBrokenCornerLights ? breakCornerLights(nextGrid) : nextGrid
  end

  def self.countNeighbors(grid, i, j)
    on = 0
    # puts "counting [#{i},#{j}]"
    on += fetch(grid, i - 1, j - 1)#[i - 1][j - 1]
    on += fetch(grid, i    , j - 1)#[i][j - 1]
    on += fetch(grid, i + 1, j - 1)#[i + 1][j - 1]
    on += fetch(grid, i - 1, j    )#[i - 1][j]
    on += fetch(grid, i + 1, j    )#[i + 1][j]
    on += fetch(grid, i - 1, j + 1)#[i - 1][j + 1]
    on += fetch(grid, i    , j + 1)#[i][j + 1]
    on += fetch(grid, i + 1, j + 1)#[i + 1][j + 1]
    # puts "countNeighbors[#{i},#{j}] = #{on}"
    on
  end

  def self.fetch(grid, x, y)
    # puts "[#{x},#{y}] --> #{x < 0 || x > size || y < 0 || y > size}"
    return 0 if x < 0 || x >= @@SIZE || y < 0 || y >= @@SIZE
    # puts "[#{x},#{y}] --> #{grid[y][x]} --> #{(grid[y][x] ? 1 : 0)}"
    (grid[y][x] ? 1 : 0)
  end

  def self.countLights(grid)
    grid.flatten.count(true)
  end

  def self.loadGrid(lines)
    # on = 0
    newGrid = []
    lines.each_with_index { |line,i|
      newGrid << []
      bits = line.to_s.each_char.to_a
      bits.each_with_index { |c,j|
        flip = (c == '#')
        # on += 1 if flip
        newGrid[i][j] = flip
      }
    }
    # puts "on = #{on}"
    newGrid
  end

  def self.breakCornerLights(grid)
    grid[    0     ][    0     ] = true
    grid[    0     ][@@SIZE - 1] = true
    grid[@@SIZE - 1][    0     ] = true
    grid[@@SIZE - 1][@@SIZE - 1] = true
    grid
  end

  def self.readInput
    File.readlines('lib/input/day18input.txt').map(&:chomp)
  end

end