# Завдання 1.

puts "\nЗАВДАННЯ 1"

def greet(name = "Гість")
  puts "Привіт, #{name}!"
end

greet
greet("Олена")

# Повторне оголошення замінює попередній метод
def greet(name = "Гість")
  puts "Вітаємо, #{name}!"
end

greet("Іван")

# Завдання 2.

puts "\nЗАВДАННЯ 2"

def person_info(name:, age: nil, city: "Невідомо")
  puts "Ім'я: #{name}"
  puts "Вік: #{age || 'Не вказано'}"
  puts "Місто: #{city}"
end

person_info(name: "Олена")
person_info(name: "Іван", age: 20, city: "Київ")

# Завдання 3.

puts "\nЗАВДАННЯ 3"

def adult?(age)
  age >= 18
end

puts adult?(20)
puts adult?(15)

# Завдання 4.

puts "\nЗАВДАННЯ 4"

class Product
  attr_reader :price, :name

  def initialize(name, price)
    @name = name
    @price = price
  end

  def +(other)
    @price + other.price
  end

  def name=(new_name)
    @name = new_name
  end
end

product1 = Product.new("Хліб", 30)
product2 = Product.new("Молоко", 40)

puts "Сума цін: #{product1 + product2}"

product1.name = "Батон"
puts "Нова назва: #{product1.name}"

# Завдання 5.

puts "\nЗАВДАННЯ 5"

def array_sum(numbers)
  numbers.sum
end

def numbers_sum(*numbers)
  numbers.sum
end

puts array_sum([10, 20, 30])
puts numbers_sum(10, 20, 30)

# Завдання 6. 

puts "\nЗАВДАННЯ 6"

def hello
  puts "Привіт!"
end

alias welcome hello

hello
welcome

# Завдання 7.

puts "\nЗАВДАННЯ 7"

def execute_block(&block)
  block.call("Ruby")
end

execute_block do |language|
  puts "Вивчаємо #{language}"
end

# Завдання 8.

puts "\nЗАВДАННЯ 8"

def without_arguments
  yield if block_given?
end

def with_arguments
  yield(10, 20) if block_given?
end

without_arguments do
  puts "Блок без аргументів"
end

with_arguments do |a, b|
  puts "Сума: #{a + b}"
end

without_arguments

# Завдання 9.

puts "\nЗАВДАННЯ 9"

proc_without_args = Proc.new do
  puts "Proc без аргументів"
end

proc_with_args = Proc.new do |a, b|
  puts "Аргументи: #{a.inspect}, #{b.inspect}"
end

proc_without_args.call

proc_with_args.call(10, 20)
proc_with_args.call(10)
proc_with_args.call(10, 20, 30)

def proc_return_example
  my_proc = Proc.new do
    return "Повернення з Proc"
  end

  my_proc.call
  "Цей рядок не виконається"
end

puts proc_return_example

# Завдання 10. 

puts "\nЗАВДАННЯ 10"

lambda_without_args = -> do
  puts "Lambda без аргументів"
end

lambda_with_args = ->(a, b) do
  puts "Сума: #{a + b}"
end

lambda_without_args.call
lambda_with_args.call(10, 20)

begin
  lambda_with_args.call(10)
rescue ArgumentError => e
  puts "Помилка: #{e.message}"
end

def lambda_return_example
  my_lambda = -> do
    return "Повернення з Lambda"
  end

  puts my_lambda.call
  "Зовнішній метод продовжує роботу"
end

puts lambda_return_example