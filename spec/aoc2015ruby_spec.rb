require 'spec_helper'
require 'aoc2015ruby/day01solution'

describe Aoc2015ruby do
  it 'has a version number' do
    expect(Aoc2015ruby::VERSION).not_to be nil
  end

  # it 'does something useful' do
  #   expect(false).to eq(true)
  # end

  it 'has solution for Day01' do
  	expect(Aoc2015ruby::solveDay01a).not_to be nil
  end
end
