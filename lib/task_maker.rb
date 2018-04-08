class TaskMaker

  attr_reader :book

  public

  def initialize(book:)
    @book = book
    @divisions = book_divisions
  end

  def run
    (1..number_of_tasks).each do |n|
      create_task(n)
    end
  end

  private

  attr_accessor :divisions

  def chunk_size
    book.chunk_size
  end

  def unit_prefix
    case book.units
    when "Pages"
      "pp."
    when "Chapters"
      "ch."
    end
  end

  def number_of_tasks
    (book.count / chunk_size).round(0)
  end

  def create_task(n)
    task_params = {}
    task_params[:book_id] = book.id
    task_params[:title] = title_for_task(n)
    task_params[:start_at] = start_at_for_task(n)
    Task.new(task_params).save
  end

  def book_divisions
    offset = 1
    arr = []
    number_of_tasks.times do |n|
      arr.push("#{unit_prefix} #{offset}-#{chunk_size * (n+1)}")
      offset += chunk_size
    end
    arr
  end

  def title_for_task(n)
    "#{book.title}, #{divisions[n-1]}"
  end

  def start_at_for_task(n)
    book.start_at + (n.days-1.day)
  end

end