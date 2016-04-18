# day04.rb
# define solution for Day04
class Day04
  def self.solve(prefix)
    1.upto 2000000 do |i| return i if (Digest::MD5.hexdigest "bgvyzdsv#{i}").start_with?(prefix) end
  end
end