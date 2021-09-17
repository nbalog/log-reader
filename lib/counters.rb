class Counters

  def uniqueCounter(paths, current_path, unique_array, store)
    unique_array = uniqueFormatter(unique_array)
    unique_array.each do |record|
      path = record[0]
      if path == current_path
        store[current_path]["unique_visits"] += 1
      end
    end
  end

  def totalCounter(paths,current_path, store)
    paths.each do |path|
      if path == current_path
        store[current_path]["total_visits"] += 1
      end
    end
  end

  private

  def uniqueFormatter(unique_array)
    unique_array.uniq
  end

end
