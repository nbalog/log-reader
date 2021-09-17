require_relative "lib/reader.rb"
require_relative "lib/store.rb"
require_relative "lib/printer.rb"

*files = ARGV
log_number = (files.length) - 1

0.upto(log_number) do |log|

  filepath = files[log]
  reader = Reader.new(filepath)
  paths = reader.find_pages()
  store = Store.new(paths)
  lines = (reader.get_line_num()) - 1

  0.upto(lines) do |line_num|
    record = reader.get_line(line_num)
    store.add(record, paths)
  end

  printer = Printer.new(paths,store)
  puts "\n"
  puts files[log]
  printer.putsTotalVisits(paths)
  puts "\n"
  printer.putsUniqueVisits(paths)
end
