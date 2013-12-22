require 'simple_todo'
require 'thor'

module SimpleTodo

  class CLI < Thor

    desc "add [TASK] [-c [CONTENT]]", "add task to todo list."
    option :content, aliases: :c
    def add(task_name)
      content options[:content]
      DB.prepare
      Task.create!(name:task_name,content:content).reload
    end

    desc "list [TYPE]", "show all tasks."
    def list(type="NOT_YET")
      DB.prepare
      tasks = Task.status_is(type).order('created_at DESC')
      display_tasks tasks
    end

    desc "done [ID]","make task done."
    def done(id)
      DB.prepare
      task = Task.find(id)
      task.update_attributes(status:1)
      display_tasks task
    end

    private
      def display_tasks(tasks)
        header = display_format('ID','Name','Content','Status')
        puts header
        puts '-'*header.size
        Array(tasks).each do |task|
          puts display_format(task.id,task.name,task.content,task.status_name)
        end
      end

      def display_format(id,name,content,status)
        name_length = 20-full_width_count(name)
        content_length = 40-full_width_count(content)
        [id.to_s.rjust(4),name.ljust(name_length),content.ljust(content_length),status.ljust(8)].join(' | ')
      end

      def full_width_count(string)
        string.each_char.select{|char| !(/[ -~。ー｀]/.match(char))}.count
      end
  end

end

