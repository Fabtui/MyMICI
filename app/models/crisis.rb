class Crisis < ApplicationRecord
  def self.alert
    days = find_crisis_days
    ingredients = find_crisis_ingredients(days)
    suspicious_ingredients = search_for_suspicious_ingredients(ingredients)
    return suspicious_ingredients
  end

  def self.find_crisis_days
    days = []
    Crisis.all.each do |crises|
      days << Day.where('date < ?', crises.start_date + 1).where('date > ?', crises.start_date - 3)
    end
    days
  end

  def self.find_crisis_ingredients(days)
    ingredients = []
    days.flatten.each do |day|
      day.meals.each do |meal|
        ingredients << meal.ingredients
      end
    end
    ingredients.flatten!
  end

  def self.search_for_suspicious_ingredients(ingredients)
    if ingredients.uniq.count != ingredients.count
      suspicious_ingredients = []
      freq = ingredients.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      ingredients.each do |ingredient|
        suspicious_ingredients << ingredient if freq[ingredient] > 1
      end
    end
    suspicious_ingredients.uniq
  end
end
