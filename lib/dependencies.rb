require "./lib/list_input"

class DependencyCheck

  def initialize(list)
    @list = ListInput.new(list)
  end

  def check_self_dependencies
    pick_doubles.each do |job|
      raise "Self dependencies spotted" if match?(job)
    end
  end

  def check_circular_dependencies
    job_combinations.each do |jobs|
      raise "Circular dependencies spotted" if multi_match?(jobs[0], jobs[1])
    end
  end

private

  def pick_doubles
    @list.sorted_list.select { |job| job.length == 2 }
  end

  def job_combinations
    pick_doubles.combination(2).to_a
  end

  def match?(arr_item)
    arr_item.chr == arr_item.reverse.chr
  end

  def multi_match?(item1, item2)
    item1.chr == item2.reverse.chr
  end

end
