# day17.rb
# define solutions for Day17
class Day17

  @@cans = []
  @@canCount = 0
  @@totalPermutations = 0;
  @@fewestCans = 50000;
  @@totalPermutationsWithFewest = 0;

  def self.solve1
    @@cans = readInput
    @@canCount = @@cans.length
    permutation = Array.new(@@canCount, false)
    solve permutation, 0  # solves both problems
    @@totalPermutations
  end

  def self.solve2()
    @@totalPermutationsWithFewest
  end

  def self.solve(permutation, index)
    if index >= @@canCount
      if sum(permutation) == 150
        @@totalPermutations += 1
        used = used(permutation)
        if (used < @@fewestCans)
          @@fewestCans = used
          @@totalPermutationsWithFewest = 1
        elsif used == @@fewestCans
          @@totalPermutationsWithFewest += 1
        end
      end
    else
      off = Array.new permutation
      on = Array.new permutation

      solve(off, 1 + index)
      on[index] = true
      solve(on, 1 + index)
    end
  end

  def self.sum(permutation)
    sum = 0
    permutation.each_with_index { |flag,index| sum += flag ? @@cans[index] : 0 }
    sum
  end

  def self.used(permutation)
    permutation.reduce(0) { |sum,flag| sum += flag ? 1 : 0 }
  end

  def self.readInput
    File.readlines('lib/input/day17input.txt').map(&:to_i)
  end

end