class Task

  attr_reader :id, :created_at
  attr_accessor :description, :status, :updated_at
  
  @@last_id = 0

  STATUS_OPTIONS = ["TODO", "IN-PROGRESS", "DONE"]
  
  def initialize(description)
    @id = self.class.next_id
    @description = description
    @status = "TODO"
    @created_at = Time.now
    @updated_at = Time.now
  end

  private

  def self.next_id
    @@last_id += 1
  end

  def self.create_task(description)
    Task.new(description)
  end
  
end
