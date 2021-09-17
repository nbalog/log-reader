class Reader
  
  attr_reader :filepath
  
  def initialize(filepath)
    @filepath = filepath
  end  
  
  def get_line(line_num)
    @filepath[line_num]
  end
  
  def get_line_num()
    @filepath.count 
  end
  
  def find_pages()
    @filepath = File.readlines(@filepath)
    pages_array = []
    @filepath.each do |line|
      split = line.split
      path = split[0]
      next if pages_array.include? path
      pages_array.push(path)
    end
    pages_array
  end

end