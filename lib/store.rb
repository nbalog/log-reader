require_relative "counters.rb"

class Store

  attr_reader :paths, :counters

  def initialize(paths, counters = Counters.new)
    @paths = paths
    @store = Hash.new
    @paths.each do |path|
      initializeStore(path)
    end
    @unique_array = []
    @counters = counters
  end

  def add(record, paths)
    record = record.split
    current_path = record[0]
    @unique_array.push(record)
    counters.totalCounter(paths, current_path, @store)
  end

  def getTotalVisits(path)
    @store[path]["total_visits"]
  end

  def getUniqueVisits(path)
    counters.uniqueCounter(@paths, path, @unique_array, @store)
    @store[path]["unique_visits"]
  end

  private

  def initializeStore(path)
    @store[path] = {
      "total_visits" => 0,
      "unique_visits" => 0
    }
  end
end
