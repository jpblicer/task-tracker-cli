require 'json'

file = "./test_data.json"

data = {
  "name": "test",
  "points": 5,
  "local": "earth"
}

if File.exist?(file)
  data = File.read(file)
  deserialized_data = JSON.parse(data)
  puts deserialized_data
else
  serialized_data = JSON.pretty_generate(data)
  File.open(file, "w") do |file|
    file.write(serialized_data)
  end
end
