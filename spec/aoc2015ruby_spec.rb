require 'spec_helper'
Dir[Dir.pwd + "/**/day*.rb"].each { |f| require f }

# # load all days' solutions
# Dir[File.dirname('lib') + '/day*.rb'].each { |file| require file }

describe Aoc2015ruby do
  it 'has a version number' do expect(Aoc2015ruby::VERSION).not_to be nil end

  # Week 1
  it 'Day01: knows Santa is on Floor 74'          do expect(Day01.solve1).to eq(74) end
  it 'Day01: knows first reaches basement @ 1795' do expect(Day01.solve2).to eq(1795) end
  it 'Day02: Elves should order 1588178 sq.ft. of wrapping paper' do expect(Day02.solve1).to eq(1588178) end
  it 'Day02: Elves should order 3783758 of ribbon'                do expect(Day02.solve2).to eq(3783758) end
  it 'Day03: The # of houses which receive 1+ present is 2081' do expect(Day03.solve1).to eq(2081) end
  it 'Day03: The # of houses which receive 1+ present is 2341' do expect(Day03.solve2).to eq(2341) end
  it 'Day04: First hash with prefix "00000" is 254575'    do expect(Day04.solve('00000')).to eq(254575) end
  # 4b takes too long
  it 'Day04: Second hash with prefix "000000" is 1038736' do expect(Day04.solve('000000')).to eq(1038736) end
  it 'Day05: Number of "good" words is 258'                   do expect(Day05.solve1).to eq(258) end
  it 'Day05: Number of "good" words with better model is 53'  do expect(Day05.solve2).to eq(53) end
  # 6a+b both take too long
  it 'Day06: There are 543903 lights on'        do expect(Day06.solve1).to eq(543903) end
  it 'Day06: The total brightness is 14687245'  do expect(Day06.solve2).to eq(14687245) end
  it 'Day07: The signal provided to a is 46065'             do expect(Day07.solve1).to eq(46065) end
  it 'Day07: The signal to a after override to b is 14134'  do expect(Day07.solve2).to eq(14134) end
  # Week 2
  it 'Day08: Total characters in memory is 1333'  do expect(Day08.solve1).to eq(1333) end
  it 'Day08: Total encrypted characters is 2046'  do expect(Day08.solve2).to eq(2046) end
  it 'Day09: The shortest path is 207'  do expect(Day09.solve1).to eq(207) end
  it 'Day09: The longest path is 804'   do expect(Day09.solve2).to eq(804) end
  it 'Day10: The length after 40 iterations is 492982'  do expect(Day10.solve1).to eq(492982) end
  # 10b takes too long
  it 'Day10: The length after 50 iterations is 6989950' do expect(Day10.solve2).to eq(6989950) end
  it 'Day11: After vzbxkghb, the next password is vzbxxyzz' do expect(Day11.solve1).to eq('vzbxxyzz') end
  it 'Day11: After vzbxxyzz, the next password is vzcaabcc' do expect(Day11.solve2).to eq('vzcaabcc') end
  it 'Day12: The sum of all numbers is 111754'  do expect(Day12.solve1).to eq(111754) end
  it 'Day12: The sum of all numbers is 65402'   do expect(Day12.solve2).to eq(65402) end
  it 'Day13: The total change in happiness is 733'  do expect(Day13.solve1).to eq(733) end
  it 'Day13: The total change in happiness is 725'  do expect(Day13.solve2).to eq(725) end
  it 'Day14: The winning reindeer has traveled 2696 miles'  do expect(Day14.solve1).to eq(2696) end
  it 'Day14: The winning reindeer Rudolph has 1084 points'  do expect(Day14.solve2).to eq(1084) end
  # Week 3
  it 'Day15: The highest cookie score is 18965440'                      do expect(Day15.solve1).to eq(18965440) end
  it 'Day15: The highest score for the 500 calorie cookie is 15862900'  do expect(Day15.solve2).to eq(15862900) end
  it 'Day16: The index of Aunt Sue is 40'                                 do expect(Day16.solve1).to eq(40) end
  it 'Day16: The index of Aunt Sue with outdated retroencabulator is 241' do expect(Day16.solve2).to eq(241) end
  # it 'Day17: Total permutations of cans is 1304'          do expect(Day17.solve1).to eq(1304) end
  # it 'Day17: Total permutations using fewest cans is 18'  do expect(Day17.solve2).to eq(18) end
  # it 'Day18: Total # of lights on is 821'                           do expect(Day18.solve1).to eq(821) end
  # it 'Day18: Total # of lights on when corners are stuck on is 886' do expect(Day18.solve2).to eq(886) end
  # it 'Day19: Total # of molecules is 509' do expect(Day19.solve1).to eq(509) end
  # it 'Day19: Shortest path is 195'        do expect(Day19.solve2).to eq(195) end
  # it 'Day20: House # is 786240' do expect(Day20.solve1).to eq(786240) end
  # it 'Day20: House # is 831600' do expect(Day20.solve2).to eq(831600) end
  # it 'Day21: Best outfit is [Longsword, Chainmail, Defense +2] with cost of 111'      do expect(Day21.solve1).to eq(111) end
  # it 'Day21: Worst outfit is [Dagger, Naked, Damage +3, Defense +3] with cost of 188' do expect(Day21.solve2).to eq(188) end
  # # Last Week
  # it 'Day22: Least amount of mana spent to win is 1824'                     do expect(Day22.solve1).to eq(1824) end
  # it 'Day22: Least amount of mana spent to win on hard difficulty is 1937'  do expect(Day22.solve2).to eq(1937) end
  # it 'Day23: The value in register b is 307'        do expect(Day23.solve1).to eq(307) end
  # it 'Day23: The value in register b if a=1 is 160' do expect(Day23.solve2).to eq(160) end
  # it 'Day24: Lowest QE for 3 compartments is 11846773891' do expect(Day24.solve1).to eq(11846773891) end
  # it 'Day24: Lowest QE for 4 compartments is 80393059'    do expect(Day24.solve2).to eq(80393059) end
  # it 'Day25: The code to enter is 2650453'            do expect(Day25.solve1).to eq(2650453) end
  # it 'Day25: You have 50 stars because you a badass'  do expect(Day25.solve2).to eq(50) end
end
