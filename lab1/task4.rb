subscriptions = [
  { user: "Andrii", plan: :premium, price: 200 },
  { user: "Olena", plan: :basic, price: 100 },
  { user: "Dmytro", plan: :premium, price: 200 },
  { user: "Maria", plan: :standard, price: 150 },
  { user: "Ivan", plan: :basic, price: 100 },
  { user: "Sofia", plan: :standard, price: 150 },
  { user: "Oleh", plan: :premium, price: 200 }
]

puts "Початковий список підписок:"

subscriptions.each do |subscription|
  puts "#{subscription[:user]} - #{subscription[:plan]} - #{subscription[:price]} грн"
end

grouped = subscriptions.group_by { |subscription| subscription[:plan] }

puts "\nДохід за тарифними планами:"

grouped.each do |plan, users|
  total = users.sum { |subscription| subscription[:price] }

  puts "Тариф: #{plan}"
  puts "Кількість користувачів: #{users.size}"
  puts "Загальний місячний дохід: #{total} грн"
  puts "----------------------------"
end