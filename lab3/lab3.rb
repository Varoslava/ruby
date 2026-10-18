# Завдання 1. Створення хеша тренувальних програм

programs = {
  "Йога" => 300,
  "Пілатес" => 350,
  "Фітнес" => 400,
  "Кардіо" => 250,
  "Кросфіт" => 500,
  "Стретчинг" => 280,
  "Аеробіка" => 320,
  "Силове тренування" => 450,
  "Бокс" => 550,
  "Танці" => 0
}

puts "Завдання 1. Тренувальні програми спортзалу:"
puts

programs.each do |name, price|
  puts "#{name} — #{price} грн"
end

# Завдання 2. Перетворення хеша в індексний масив

puts "\nЗавдання 2. Індексний масив тренувальних програм:"
puts

programs_array = programs.to_a

programs_array.each_with_index do |program, index|
  puts "#{index + 1}. #{program[0]} — #{program[1]} грн"
end

# Завдання 3. Сортування тренувальних програм

puts "\nЗавдання 3. Сортування тренувальних програм"
puts "1 — За назвою програми"
puts "2 — За ціною"
print "Оберіть спосіб сортування: "

choice = gets.strip

case choice
when "1"
  sorted_programs = programs.sort_by { |name, price| name }
  puts "\nПрограми, відсортовані за назвою:"

when "2"
  sorted_programs = programs.sort_by { |name, price| price }
  puts "\nПрограми, відсортовані за ціною:"

else
  puts "Помилка! Невірний вибір."
  sorted_programs = []
end

sorted_programs.each do |name, price|
  puts "#{name} — #{price} грн"
end

# Завдання 4. Три програми з найкоротшими назвами

puts "\nЗавдання 4. Три програми з найкоротшими назвами:"
puts

shortest_programs = programs.sort_by { |name, price| name.length }.first(3)

shortest_programs.each do |name, price|
  puts "#{name} — #{price} грн"
end

# Завдання 5. П'ять найдешевших програм з ненульовою ціною

puts "\nЗавдання 5. П'ять найдешевших програм з ненульовою ціною:"
puts

cheapest_programs = programs.select { |name, price| price > 0 }
                            .sort_by { |name, price| price }
                            .first(5)

cheapest_programs.each do |name, price|
  puts "#{name} — #{price} грн"
end

# Завдання 6. Пошук тренувальної програми

puts "\nЗавдання 6. Пошук тренувальної програми"
puts

print "Введіть назву тренувальної програми: "
search_name = gets.strip

if programs.key?(search_name)
  puts "Програму знайдено!"
  puts "Назва: #{search_name}"
  puts "Ціна: #{programs[search_name]} грн"
else
  puts "Програму '#{search_name}' не знайдено."
end

# Завдання 7. Загальна вартість усіх програм

puts "\nЗавдання 7. Загальна вартість усіх програм"
puts

total_price = programs.values.sum

puts "Загальна вартість усіх програм: #{total_price} грн"

# Завдання 8. Перевірка програм без заданої ціни

puts "\nЗавдання 8. Перевірка програм без заданої ціни"
puts

programs_without_price = programs.select { |name, price| price.nil? || price == 0 }

if programs_without_price.empty?
  puts "Усі програми мають задану ціну."
else
  programs_without_price.each do |name, price|
    puts "Програма '#{name}' не має заданої ціни."

    loop do
      print "Введіть ціну для програми '#{name}': "
      new_price = gets.to_i

      if new_price > 0
        programs[name] = new_price
        break
      else
        puts "Помилка! Ціна повинна бути більшою за 0."
      end
    end
  end
end

puts "\nОновлений список тренувальних програм:"

programs.each do |name, price|
  puts "#{name} — #{price} грн"
end