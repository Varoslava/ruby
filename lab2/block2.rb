matrix = [
  [5, 2, 8, 4],
  [1, 9, 3, 7],
  [2, 4, 6, 8],
  [3, 5, 7, 1]
]

puts "Початкова матриця:"
matrix.each { |row| p row }

# Завдання 5. Метод 1 - через цикл while

result1 = matrix.dup
diagonal = []

i = 0
while i < matrix.length
  diagonal << matrix[i][i]
  i += 1
end

i = 0
while i < diagonal.length - 1
  j = 0

  while j < diagonal.length - 1 - i
    if diagonal[j] > diagonal[j + 1]
      diagonal[j], diagonal[j + 1] = diagonal[j + 1], diagonal[j]
      result1[j], result1[j + 1] = result1[j + 1], result1[j]
    end

    j += 1
  end

  i += 1
end

puts "\nЗавдання 5. Метод 1 (while):"
result1.each { |row| p row }

# Завдання 5. Метод 2 - через ітератор sort_by

result2 = matrix.each_with_index.sort_by do |row, index|
  row[index]
end.map do |row, index|
  row
end

puts "\nЗавдання 5. Метод 2 (sort_by):"
result2.each { |row| p row }

# Завдання 6. Метод 1 - через цикл while

rows1 = []

i = 0
while i < matrix.length
  increasing = true
  j = 0

  while j < matrix[i].length - 1
    if matrix[i][j] >= matrix[i][j + 1]
      increasing = false
      break
    end

    j += 1
  end

  if increasing
    rows1 << i + 1
  end

  i += 1
end

puts "\nЗавдання 6. Метод 1 (while):"
p rows1

# Завдання 6. Метод 2 - через ітератор each_with_index

rows2 = []

matrix.each_with_index do |row, index|
  if row.each_cons(2).all? { |a, b| a < b }
    rows2 << index + 1
  end
end

puts "\nЗавдання 6. Метод 2 (each_with_index):"
p rows2
