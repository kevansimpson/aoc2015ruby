require 'spec_helper'
require 'day01'

describe Aoc2015ruby do
  it 'has a version number' do
    expect(Aoc2015ruby::VERSION).not_to be nil
  end

  # it 'does something useful' do
  #   expect(false).to eq(true)
  # end
  it 'Day01: knows Santa is on Floor 74'          do expect(Day01.solve1).to eq(74) end
  it 'Day01: knows first reaches basement @ 1795' do expect(Day01.solve2).to eq(1795) end
end
