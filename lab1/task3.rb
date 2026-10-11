numbers = [-5, 10, 0, 7, -3, 15, 8, -2, 20, -10]

puts "Початковий масив:"
p numbers

count1 = numbers.count { |number| number > 0 }

count2 = numbers.select { |number| number > 0 }.size

puts "Кількість додатних чисел (count): #{count1}"
puts "Кількість додатних чисел (select + size): #{count2}"