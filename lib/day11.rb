# day11.rb
# define solutions for Day11
class Day11

  @@password = 'vzbxkghb'
  @@allSequences = Regexp.union [*?a..?z].each_cons(3).map(&:join)
  @@firstNext = ''

  def self.solve1
    @@firstNext = nextValidPassword
  end

  def self.solve2
    nextValid = @@firstNext == '' ? solve1 : @@firstNext
    nextValidPassword(nextValid)
  end

  def self.nextValidPassword(text=@@password)
    nextPswd = nextPassword text
    while !valid?(nextPswd)
      nextPswd = nextPassword(nextPswd)
    end
    nextPswd
    # the following line only finds the first solution, can't start it "after" first next pswd
    # text.succ! until text[@@allSequences] && text !~ /[iol]/ && text.scan(/([a-z])\1/).size > 1
    # text
  end

  def self.valid?(text)
    text[@@allSequences] && text !~ /[iol]/ && text.scan(/([a-z])\1/).size > 1
  end

  # copied from https://www.reddit.com/r/adventofcode/comments/3wbzyv/day_11_solutions/ as reference
  def self.stolen(text=@@password)
    r = Regexp.union [*?a..?z].each_cons(3).map(&:join)
    text.succ! until text[r] && text !~ /[iol]/ && text.scan(/(.)\1/).size > 1
    p text
  end

  def self.nextPassword(text)
    ltrs = text.to_s.each_char.to_a
    (ltrs.length - 1).step(0, -1) { |index|
      nextLtr = nextLetter(ltrs[index])
      ltrs[index] = nextLtr
      if nextLtr != 'a'
        break
      end
    }
    ltrs.join
  end

  def self.nextLetter(ltr)
    nextLtr = ltr == 'z' ? 'a' : ltr.next!

    case nextLtr
      when 'i' then return 'j'
      when 'l' then return 'm'
      when 'o' then return 'p'
      else
        nextLtr
    end
  end
end