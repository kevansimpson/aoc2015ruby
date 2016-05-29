# day07.rb
# define solutions for Day07
class Day07

  @@values = {}

  @@reAnd = /(.+)\sAND\s(.+)\s*/
  @@reOr = /(.+)\sOR\s(.+)\s*/
  @@reLShift = /(.+)\sLSHIFT\s(.+)\s*/
  @@reRShift = /(.+)\sRSHIFT\s(.+)\s*/
  @@reNot = /\s*NOT\s(.+)\s*/

  def self.solve1
    vars = readInput
    # puts vars
    resolve(vars, 'a')
    @@values['a']
  end

  def self.solve2
    @@values = {}
    @@values['b'] = 46065
    vars = readInput
    resolve(vars, 'a')
    @@values['a']
  end

  def self.resolve(variables, wire)
    instruction = variables[wire]
    # puts "Resolving: #{wire} => #{instruction}"
    if @@values.key? wire
      return Integer(@@values[wire])
    else
      if instruction == nil
        return Integer(wire)
      else
        case instruction
          when Integer
            @@values[wire] = Integer(instruction)
          when @@reAnd
            left,right = @@reAnd.match(instruction).captures
            @@values[wire] = resolve(variables, left) & resolve(variables, right)
          when @@reOr
            left,right = @@reOr.match(instruction).captures
            @@values[wire] = resolve(variables, left) | resolve(variables, right)
          when @@reLShift
            left,right = @@reLShift.match(instruction).captures
            @@values[wire] = resolve(variables, left) << resolve(variables, right)
          when @@reRShift
            left,right = @@reRShift.match(instruction).captures
            @@values[wire] = resolve(variables, left) >> resolve(variables, right)
          when @@reNot
            var = @@reNot.match(instruction).captures[0]
            @@values[wire] = (65535 - resolve(variables, var))
          else
            temp = Integer(instruction) rescue false
            if temp.is_a? Integer
              @@values[wire] = temp #Integer(instruction)
              return temp
            else
              @@values[wire] = resolve(variables, instruction)
            end
        end
      end
    end
  end

  def self.readInput
    # Hash[] constructs a hash from array.
    #     Hash[array.map {|el| el.split ':'}]
    lines = File.readlines('lib/input/day07input.txt').map {|x| x.chomp }
    Hash[lines.map {|line| line.split("\s->\s").reverse }]
  end
end