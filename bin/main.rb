require 'optparse'

require_relative'../lib/task'
require_relative '../lib/json_handler'

parser = OptionParser.new

def add_task(description)
  task = Task.create_task(description)
  JsonHandler.append_task(task)
  puts "Added New Task: #{task.description}"
end

parser.on('-a DESCRIPTION', 'Add Task') do |description|
  add_task(description)
end

parser.on('-r ID', 'Remove Task') do |id|
  JsonHandler.remove_task(id)
end

parser.on('-la', 'List All Tasks') do |id|
  JsonHandler.list_tasks
end

parser.on('-lat', 'List All Tasks Marked "TODO"') do |id|
  JsonHandler.list_in_progress_tasks
end


parser.parse!
