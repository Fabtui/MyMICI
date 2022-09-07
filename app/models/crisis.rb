class Crisis < ApplicationRecord
  has_many :days

  def self.suspicious_ingredients
    days = find_crisis_days
    ingredients = find_crisis_ingredients(days)
    search_for_suspicious_ingredients(ingredients)
  end

  def self.suspicious_elements
    days = find_crisis_days
    find_crisis_elements(days)
  end

  private_class_method def self.find_crisis_days
    days = []
    Crisis.all.each do |crisis|
      days << Day.where('date < ?', crisis.start_date + 1).where('date > ?', crisis.start_date - 3)
      days.last.each do |day|
        day.crisis = crisis
      end
    end
    days.flatten!
  end

  private_class_method def self.find_crisis_ingredients(days)
    ingredients = []
    days.flatten.each do |day|
      day.meals.each { |meal| ingredients << meal.ingredients }
    end
    ingredients.flatten!
  end

  private_class_method def self.search_for_suspicious_ingredients(ingredients)
    suspicious_ingredients = frequencies(ingredients, 1) if ingredients.uniq.count != ingredients.count
    suspicious_ingredients.uniq
  end

  private_class_method def self.find_crisis_elements(days)
    require_relative '../data/categories'
    categories = CATEGORIES.last(CATEGORIES.count - 5)
    elements = []
    days.each do |day|
      categories.each do |category|
        elements << category[0] if day.send(category[0]) > category[2]
      end
    end
    suspicious_elements = frequencies(elements, 2)
    suspicious_elements.uniq
  end

  private_class_method def self.frequencies(array, frequency)
    elements = []
    freq = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    array.each do |a|
      elements << a if freq[a] > frequency
    end
    elements
  end
end
