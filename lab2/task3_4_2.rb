require 'fileutils'
require 'date'

# Завдання 4. Метод 2 - через цикл while

date = Date.today.strftime("%Y-%m-%d")

files = Dir.glob("txt_files/*.txt")

i = 0

while i < files.length
  file = files[i]

  filename = File.basename(file)

  if filename.start_with?("#{date}_")
    i += 1
    next
  end

  new_name = "#{date}_#{filename}"
  new_path = File.join("txt_files", new_name)

  if File.exist?(new_path)
    puts "Файл #{new_name} вже існує, пропускаємо."
    i += 1
    next
  end

  FileUtils.mv(file, new_path)

  puts "#{filename} -> #{new_name}"

  i += 1
end