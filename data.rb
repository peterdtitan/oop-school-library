require 'json'

def save_data(data, filename)
  serialized_data = data.map(&:to_h)
  File.write(filename, JSON.generate(serialized_data))
end

def ensure_files_exist
  ['books.json', 'people.json', 'rentals.json'].each do |filename|
    File.write(filename, '[]') unless File.exist?(filename)
  end
end

def load_data_from_file(filename)
  if File.exist?(filename)
    json_data = File.read(filename)
    JSON.parse(json_data)
  else
    puts "#{filename} file not found. Creating a new one"
    []
  end
end
