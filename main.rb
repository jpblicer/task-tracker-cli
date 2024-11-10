require 'optparse'
require 'json'

parser = OptionParser.new


file = "./test_data.json"

data = {
  "name": "test",
  "points": 5,
  "local": "earth"
}

serialized_data = JSON.pretty_generate(data)

File.open(file, "w") do |file|
  file.write(serialized_data)
end

def hello
  "Hello World"
end


parser.on('-h', 'Run Hello') do |value|
  puts hello
end



parser.parse!
