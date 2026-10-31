module BuildingUtilities
  def calculate_floor_count
    (height.to_f / floor_height).ceil
  end

  def heating_status
    heated ? "Опалення увімкнене" : "Опалення вимкнене"
  end
end

module BuildingCategories
  def categories
    ["Житлова", "Офісна", "Громадська"]
  end
end

class Building
  include BuildingUtilities
  extend BuildingCategories

  attr_reader :name, :area, :height, :floor_height, :heated

  def initialize(name, area, height, floor_height, heated)
    @name = name
    self.area = area
    self.height = height
    self.floor_height = floor_height
    @heated = heated
  end

  def area=(value)
    raise ArgumentError, "Площа повинна бути додатною" unless value > 0
    @area = value
  end

  def height=(value)
    raise ArgumentError, "Висота повинна бути додатною" unless value > 0
    @height = value
  end

  def floor_height=(value)
    raise ArgumentError, "Висота поверху повинна бути додатною" unless value > 0
    @floor_height = value
  end

  def heated=(value)
    @heated = value
  end

  def heating_cost(rate = 50)
    return 0 unless heated

    area * rate
  end

  def description
    "Будівля: #{name}, площа: #{area} м², поверхів: #{calculate_floor_count}"
  end
end

class ResidentialBuilding < Building
  attr_reader :apartments

  def initialize(name, area, height, floor_height, heated, apartments)
    super(name, area, height, floor_height, heated)
    @apartments = apartments
  end

  def heating_cost(rate = 50)
    super(rate) * 1.0
  end

  def description
    "#{super}, тип: житловий будинок, квартир: #{apartments}"
  end
end

class OfficeBuilding < Building
  attr_reader :workplaces

  def initialize(name, area, height, floor_height, heated, workplaces)
    super(name, area, height, floor_height, heated)
    @workplaces = workplaces
  end

  def heating_cost(rate = 50)
    super(rate) * 1.1
  end

  def description
    "#{super}, тип: офісна будівля, робочих місць: #{workplaces}"
  end
end

class PublicBuilding < Building
  attr_reader :visitor_capacity

  def initialize(name, area, height, floor_height, heated, visitor_capacity)
    super(name, area, height, floor_height, heated)
    @visitor_capacity = visitor_capacity
  end

  def heating_cost(rate = 50)
    super(rate) * 1.2
  end

  def description
    "#{super}, тип: громадська будівля, місткість: #{visitor_capacity} осіб"
  end
end

residential = ResidentialBuilding.new("Житловий будинок", 1200, 30, 3, true, 40)
office = OfficeBuilding.new("Бізнес-центр", 2000, 36, 3, true, 150)
public = PublicBuilding.new("Торговий центр", 3500, 24, 4, true, 500)

buildings = [residential, office, public]

puts "ДОСТУПНІ КАТЕГОРІЇ БУДІВЕЛЬ:"
puts Building.categories

puts "\nІНФОРМАЦІЯ ПРО БУДІВЛІ:"

buildings.each do |building|
  puts "\n#{building.description}"
  puts "Кількість поверхів: #{building.calculate_floor_count}"
  puts "Стан опалення: #{building.heating_status}"
  puts "Вартість опалення: #{building.heating_cost.round(2)} грн"
end

puts "\nПЕРЕВІРКА ГЕТТЕРІВ ТА СЕТТЕРІВ:"
puts "Початкова площа: #{residential.area}"
residential.area = 1500
puts "Нова площа: #{residential.area}"

puts "\nПЕРЕВІРКА ІНКАПСУЛЯЦІЇ:"
begin
  residential.area = -500
rescue ArgumentError => e
  puts "Помилка при зміні площі: #{e.message}"
end

puts "\nПЕРЕВІРКА SINGLETON-МЕТОДУ:"

office2 = OfficeBuilding.new("Офісна будівля №2", 1500, 30, 3, true, 100)

puts "Вартість опалення до змін:"
puts "Бізнес-центр: #{office.heating_cost.round(2)} грн"
puts "Офісна будівля №2: #{office2.heating_cost.round(2)} грн"

class << office
  def heating_cost(rate = 50)
    super(rate) * 0.9
  end
end

puts "\nВартість опалення після перевизначення Singleton-методу:"
puts "Бізнес-центр зі знижкою: #{office.heating_cost.round(2)} грн"
puts "Офісна будівля №2 без змін: #{office2.heating_cost.round(2)} грн"