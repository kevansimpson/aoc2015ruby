require 'spec_helper'
Dir[Dir.pwd + "/**/day*.rb"].each { |f| require f }

# # load all days' solutions
# Dir[File.dirname('lib') + '/day*.rb'].each { |file| require file }

describe Aoc2015ruby do
  it 'has a version number' do expect(Aoc2015ruby::VERSION).not_to be nil end

  it 'Day01: knows Santa is on Floor 74'          do expect(Day01.solve1).to eq(74) end
  it 'Day01: knows first reaches basement @ 1795' do expect(Day01.solve2).to eq(1795) end

  it 'Day02: Elves should order 1588178 sq.ft. of wrapping paper' do expect(Day02.solve1).to eq(1588178) end
  it 'Day02: Elves should order 3783758 of ribbon'                do expect(Day02.solve2).to eq(3783758) end

  it 'Day03: The # of houses which receive 1+ present is 2081' do expect(Day03.solve1).to eq(2081) end
  it 'Day03: The # of houses which receive 1+ present is 2341' do expect(Day03.solve2).to eq(2341) end

  it 'Day04: First hash with prefix "00000" is 254575'    do expect(Day04.solve('00000')).to eq(254575) end
  it 'Day04: Second hash with prefix "000000" is 1038736' do expect(Day04.solve('000000')).to eq(1038736) end

  it 'Day05: Number of "good" words: 258'                   do expect(Day05.solve1).to eq(258) end
  it 'Day05: Number of "good" words with better model: 53'  do expect(Day05.solve2).to eq(53) end

  it 'Day06: There are 543903 lights on'        do expect(Day06.solve1).to eq(543903) end
  it 'Day06: The total brightness is 14687245'  do expect(Day06.solve2).to eq(14687245) end

  it 'Day07: The signal provided to a is 46065'             do expect(Day07.solve1).to eq(46065) end
  it 'Day07: The signal to a after override to b is 14134'  do expect(Day07.solve2).to eq(14134) end

  it 'Day08: Total characters in memory is 1333'  do expect(Day08.solve1).to eq(1333) end
  it 'Day08: Total encrypted characters is 2046'  do expect(Day08.solve2).to eq(2046) end

end
