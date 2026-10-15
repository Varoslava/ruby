require 'csv'

# Завдання 5. Метод 1 - через CSV.foreach та Hash

totals1 = Hash.new(0)

CSV.foreach("sales.csv", headers: true) do |row|
  product = row["Product"]
  price = row["Price"].to_f
  quantity = row["Quantity"].to_i

  totals1[product] += price * quantity
end

CSV.open("summary.csv", "w") do |csv|
  csv << ["Product", "Total"]

  totals1.each do |product, total|
    csv << [product, total]
  end
end

puts "Завдання 5. Метод 1:"
puts "Результат збережено у summary.csv"

# Завдання 5. Метод 2 - через group_by та sum

sales = []

CSV.foreach("sales.csv", headers: true) do |row|
  sales << {
    product: row["Product"],
    price: row["Price"].to_f,
    quantity: row["Quantity"].to_i
  }
end

groups = sales.group_by { |sale| sale[:product] }

totals2 = groups.transform_values do |items|
  items.sum { |sale| sale[:price] * sale[:quantity] }
end

CSV.open("summary_method2.csv", "w") do |csv|
  csv << ["Product", "Total"]

  totals2.each do |product, total|
    csv << [product, total]
  end
end

puts "\nЗавдання 5. Метод 2:"
puts "Результат збережено у summary_method2.csv"