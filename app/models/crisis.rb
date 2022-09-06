class Crisis < ApplicationRecord
  def self.alert
    days = []
    Crisis.all.each do |crises|
      days << Day.where('date < ?', crises.start_date + 1).where('date > ?', crises.start_date - 3)
    end
    ingredients = []
    days.flatten.each do |day|
      day.meals.each do |meal|
        ingredients << meal.ingredients
      end
    end
    ingredients.flatten!
    if ingredients.uniq.count != ingredients.count
      suspicious_ingredients = []
      freq = ingredients.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      ingredients.each do |ingredient|
        suspicious_ingredients << ingredient if freq[ingredient] > 1
      end
    end
    return suspicious_ingredients.uniq
  end
end
