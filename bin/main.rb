require 'optparse'

require_relative '../lib/json_handler'

parser = OptionParser.new

def hello
  "Hello World"
end

parser.on('-h', 'Run Hello') do |value|
  puts hello
end

parser.parse!
