require_relative "store.rb"
require_relative "sorter.rb"

class Printer

  attr_reader :path, :store, :sorter

  def initialize(path, store, sorter = Sorter.new)
    @path = path
    @store = store
    @unsorted_hash, @sorted_hash  = Hash.new
    @sorter = sorter
  end

  def putsTotalVisits(paths)
    @unsorted_hash = formatter(paths,'total')
    @sorted_hash_total = sorter.sort(@unsorted_hash)
    @sorted_hash_total.each do |key, value|
      puts "#{key} #{value} total views"
    end
  end

  def putsUniqueVisits(paths)
    @unsorted_hash = formatter(paths,'unique')
    @sorted_hash_unique = sorter.sort(@unsorted_hash)
    @sorted_hash_unique.each do |key, value|
      puts "#{key} #{value} unique views"
    end
  end
  
  private
  
  def formatter(paths, flag)
    paths.each do |path|
      case flag
      when 'total'
        visits = store.getTotalVisits(path)
      when 'unique'
        visits = store.getUniqueVisits(path)  
      end
      @unsorted_hash[path] = visits
    end
    @unsorted_hash
  end
end
