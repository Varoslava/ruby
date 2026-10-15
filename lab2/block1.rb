numbers = [4, -3, 8, 0, -7, 6, 2, -1]

puts "Початковий масив:"
p numbers

# Завдання 7. Метод 1 - через цикл while

min = numbers[0]

i = 1
while i < numbers.length
  if numbers[i] < min
    min = numbers[i]
  end
  i += 1
end

result1 = numbers.dup

i = 0
while i < result1.length
  if result1[i] > 0
    result1[i] = min
  end
  i += 1
end

puts "\nЗавдання 7. Метод 1 (while):"
p result1

# Завдання 7. Метод 2 - через ітератор map

min = numbers.min

result2 = numbers.map do |number|
  number > 0 ? min : number
end

puts "\nЗавдання 7. Метод 2 (map):"
p result2

# Завдання 8. Метод 1 - через цикл while

product1 = 1

i = 0
while i < numbers.length
  if numbers[i].even?
    product1 *= numbers[i]
  end
  i += 1
end

puts "\nЗавдання 8. Метод 1 (while):"
puts "Добуток парних елементів: #{product1}"

# Завдання 8. Метод 2 - через ітератор each

product2 = 1

numbers.each do |number|
  if number.even?
    product2 *= number
  end
end

puts "\nЗавдання 8. Метод 2 (each):"
puts "Добуток парних елементів: #{product2}"
