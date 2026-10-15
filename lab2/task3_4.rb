require 'fileutils'
require 'date'

# Завдання 4. Метод 1 - через Dir.glob та each

date = Date.today.strftime("%Y-%m-%d")

files = Dir.glob("txt_files/*.txt")

files.each do |file|
  filename = File.basename(file)

  if filename.start_with?("#{date}_")
    next
  end

  new_name = "#{date}_#{filename}"
  new_path = File.join("txt_files", new_name)

  if File.exist?(new_path)
    puts "Файл #{new_name} вже існує, пропускаємо."
    next
  end

  FileUtils.mv(file, new_path)

  puts "#{filename} -> #{new_name}"
end