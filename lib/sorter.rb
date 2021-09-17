class Sorter

  def sort(unsorted_hash)
    sorted_hash = Hash.new
    sorted_hash = unsorted_hash.sort_by {|k, v| v}.reverse
    sorted_hash
  end

end
