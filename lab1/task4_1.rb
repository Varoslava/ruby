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

income = {}
counts = {}

subscriptions.each do |subscription|
  plan = subscription[:plan]

  income[plan] ||= 0
  counts[plan] ||= 0

  income[plan] += subscription[:price]
  counts[plan] += 1
end

puts "\nДохід за тарифними планами:"

income.each do |plan, total|
  puts "Тариф: #{plan}"
  puts "Кількість користувачів: #{counts[plan]}"
  puts "Загальний місячний дохід: #{total} грн"
  puts "----------------------------"
end