words = ["ruby", "python", "java", "javascript", "php", "programming"]

puts "Початковий масив:"
p words

result = words.map { |word| word.capitalize }
result = result.sort_by { |word| word.length }

puts "Масив після обробки:"
p result