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

parser.on('-l', 'List All Tasks') do |id|
  JsonHandler.list_tasks
end

parser.on('-i', 'List All Tasks Marked "IN-PROGRESS"') do |id|
  JsonHandler.list_in_progress_tasks
end

parser.on('-m', 'List Incomplete Tasks') do |id|
  JsonHandler.list_incomplete_tasks
end

parser.on('-p ID', 'Mark Task as "IN-PROGRESS"') do |id|
  JsonHandler.update_task_in_progress(id)
end

parser.on('-d ID', 'Mark Task as "DONE"') do |id|
  JsonHandler.update_task_done(id)
end

parser.parse!
