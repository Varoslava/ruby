print "Введіть двозначне або тризначне число: "
number = gets.to_i

n = number.abs

if n >= 10 && n <= 999
  sum = 0

  while n > 0
    sum += n % 10
    n /= 10
  end

  puts "Сума цифр числа #{number}: #{sum}"
else
  puts "Помилка! Введіть двозначне або тризначне число."
end