# day10.rb
# define solutions for Day10
class Day10

  @@start = '1321131112'

  def self.solve1
    countNumbers 40
  end

  def self.solve2
    countNumbers 50
  end

  def self.countNumbers(iter, text=@@start)
    (1..iter).each do |digit| text = buildText(text) end
    text.length
  end

  def self.buildText(text)
    numbers = ''
    count = 0
    array = text.to_s.each_char.to_a
    digit = array[0]

    array.each do |ch|
      if digit == ch
        count += 1
      else
        numbers << count.to_s
        numbers << digit.to_s
        digit = ch
        count = 1
      end
    end

    numbers << count.to_s
    numbers << digit.to_s
    numbers
  end
end