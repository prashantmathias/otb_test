require "./lib/dependencies"

class ListOutput

  def initialize(list)
    @dependency_check = DependencyCheck.new(list)
    @list = ListInput.new(list)
  end

  def display
    dependency_check.check_self_dependencies
    dependency_check.check_circular_dependencies
    printList
  end

private

  attr_reader :dependency_check, :list

  def printList
    list.sorted_list.join.chars.uniq
  end

end
