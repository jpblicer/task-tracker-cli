require 'json'

class JsonHandler
  FILE_PATH = "./tasks.json"

  private

  def self.read_tasks
    if File.exist?(FILE_PATH)
      file = File.read(FILE_PATH)
      tasks_data = JSON.parse(file)
    else
      tasks_data = [] 
    end
    tasks_data
  end

  def self.serializer(task)
    {
      'id' => task.id,
      'description' => task.description,
      'status' => task.status,
      'created_at' => task.created_at,
      'updated_at' => task.updated_at
    }
  end

  def self.next_id
    tasks = read_tasks
    tasks.empty? ? 1 : tasks.max_by { |task| task['id'] }['id'] + 1
  end
  
  def self.save_tasks(tasks)
    File.write(FILE_PATH, JSON.pretty_generate(tasks))
  end

  def self.append_task(task)
    tasks = read_tasks
    tasks << serializer(task)
    save_tasks(tasks)
  end
  
  def self.remove_task(id)
    tasks = read_tasks
    task = tasks.find { |task| task['id'] == id.to_i }

    if task
      puts "Removing #{task['description']}..."
      tasks.delete(task)
      save_tasks(tasks)
      puts "Removed successfully"
    else
      puts "No task found with ID #{id}."
    end
  end

  def self.list_tasks
    tasks = read_tasks
    print_tasks(tasks)
  end

  
  def self.list_in_progress_tasks
    tasks = read_tasks.select { |task| task['status'] == "IN-PROGRESS"} 
    print_tasks(tasks)
  end

  def self.list_incomplete_tasks
    tasks = read_tasks.select { |task| task['status'] == "IN-PROGRESS" || task['status'] == "TODO" } 
    print_tasks(tasks)
  end

  def self.update_task_in_progress(id)
    tasks = read_tasks
    task = tasks.find { |task| task['id'] == id.to_i }

    if task
      puts "Marking #{task['description']} as IN PROGRESS..."
      task['status'] = "IN-PROGRESS"
      save_tasks(tasks)
      puts "Updated status to #{task['status']} successfully"
    else
      puts "No task found with ID #{id}."
    end
  end

  def self.update_task_done(id)
    tasks = read_tasks
    task = tasks.find { |task| task['id'] == id.to_i }

    if task
      puts "Marking #{task['description']} as Done..."
      task['status'] = "DONE"
      save_tasks(tasks)
      puts "Updated status to #{task['status']} successfully"
    else
      puts "No task found with ID #{id}."
    end
  end

  private

  def self.print_tasks(tasks)
    if tasks.empty?
      puts "No Tasks"
    else
      tasks.each { |task| puts "#{task['id']} ) #{task['status']} : #{task['description']}"}
    end
  end
end
