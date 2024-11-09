require 'optparse'

parser = OptionParser.new


def hello
  "Hello World"
end


parser.on('-h', 'Run Hello') do |value|
  puts hello
end


parser.parse!
