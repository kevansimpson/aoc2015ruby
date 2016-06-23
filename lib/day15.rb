# day15.rb
# define solutions for Day15
class Day15

  @@ingredientMap = {}
  @@scoreMap = {}
  @@highestScore = -1

  def self.solve1
    logIngredients readInput
    buildAllRecipes(@@ingredientMap.values.to_a, 0, Recipe.new, 100, -1)
    @@scoreMap.max_by(&:first)[0]
  end

  def self.solve2
    @@scoreMap = {}
    @@highestScore = -1
    buildAllRecipes(@@ingredientMap.values.to_a, 0, Recipe.new, 100, 500)
    @@scoreMap.max_by(&:first)[0]
  end

  def self.buildAllRecipes(ingredients, ingredientIndex, recipe, total, caloricRequirement=-1)
    if ingredients.length <= ingredientIndex
      if recipe.sumTeaspoons() == 100
        if caloricRequirement <= 0 || recipe.caloricCount(@@ingredientMap) == caloricRequirement
          score = recipe.calculateScore(@@ingredientMap)
          if score > @@highestScore
            # puts "Recipe: #{recipe} with score: #{score}"
            @@highestScore = score
            @@scoreMap[score] = recipe
          end
        end
      end
    else
      (0..total).each do |index|
        current = ingredients[ingredientIndex]
        recipe.setTeaspoons(current["name"], index)
        buildAllRecipes(ingredients, ingredientIndex + 1, recipe, total - index, caloricRequirement)
      end
    end
  end

  # def self.identifyWinners(seconds)
  #   distances = runRace seconds
  #   distances.max_by(&:first)
  # end
  #
  # def self.runRace(seconds)
  #   distances = {}
  #   @@ingredientMap.each {|name, sdr|
  #     dist = calculateHowFar sdr, seconds
  #     if distances.has_key? dist
  #       distances[dist].push(name)
  #     else
  #       distances[dist] = [name]
  #     end
  #   }
  #   distances
  # end
  #
  # def self.runForPoints(seconds)
  #   points = Hash.new(0)
  #   (1..seconds).each do | ix |
  #     winners = identifyWinners ix
  #     winners[1].each { |reindeer| points[reindeer] +=1 }
  #   end
  #   points.max_by{|k,v| v}
  # end
  #
  # def self.calculateHowFar(sdr, seconds)
  #   totalTime = sdr["d"] + sdr["r"]
  #   ((seconds / totalTime) * sdr["d"] * sdr["s"] + [(seconds % totalTime), sdr["d"]].min * sdr["s"])
  # end

  def self.logIngredients(lines)
    lines.each { |ingredient|
      #Frosting: capacity 4, durability -2, flavor 0, texture 0, calories 5
      name,capacity,durability,flavor,texture,calories = /(\w+)[^-]+(-?\d+)[^-]+(-?\d+)[^-]+(-?\d+)[^-]+(-?\d+)[^-]+(-?\d+)/.match(ingredient).captures
      # puts "#{name} => #{capacity}, #{durability}, #{flavor}, #{texture}, #{calories}"
      @@ingredientMap[name] = { "name" => name,
          "cap" => capacity.to_i, "dur" => durability.to_i, "fla" => flavor.to_i, "tex" => texture.to_i, "cal" => calories.to_i
      }
    }
  end

  def self.readInput
    File.readlines('lib/input/day15input.txt').map(&:chomp)
  end
end

class Recipe
  def initialize
    @tspnPerIngredient = {}
  end

  def [](key)
    @tspnPerIngredient[key]
  end

  def to_s
    @tspnPerIngredient.to_s
  end

  def calculateScore(cookbook)
    score = 1
    ["cap","dur","fla","tex"].each do |trait|
      value = 0
      cookbook.each_key { |iname|
        ingredient = cookbook[iname]
        value += @tspnPerIngredient[iname].to_i * ingredient[trait].to_i
      }
      return 0 if value <= 0
      score *= value
    end
    score
  end

  def caloricCount(cookbook)
    count = 0
    cookbook.each_key { |iname|
      ingredient = cookbook[iname]
      count += @tspnPerIngredient[iname].to_i * ingredient["cal"].to_i
    }

    return 0 if count <= 0
    count
  end

  def setTeaspoons(ingredient, teaspoons)
    # puts "setTspns @ #{ingredient} = #{teaspoons}"
    @tspnPerIngredient[ingredient] = teaspoons.to_i
    # puts "#{@tspnPerIngredient}"
  end

  def sumTeaspoons
    @tspnPerIngredient.values.reduce(0) { |sum,val| sum += val }
  end

end