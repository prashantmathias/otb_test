class Sequencer

  attr_accessor :list

  def initialize(list)
    @list = list
  end

  def listSetup
    list.gsub(/[=> ]/,"").reverse.split(',')
  end

  def sortedList
    listSetup.sort {|a,b| b <=> a}
  end

  def checkSelfDependencies
    pickDoubles.each do |job|
      raise "Self dependencies spotted" if match?(job)
    end
  end

  def checkCircularDependencies
    jobCombinations.each do |jobs|
      raise "Circular dependencies spotted" if multiMatch?(jobs[0], jobs[1])
    end
  end

  def display
    checkSelfDependencies
    checkCircularDependencies
    printList
  end

private

  def pickDoubles
    sortedList.select { |job| job.length == 2 }
  end

  def jobCombinations
    pickDoubles.combination(2).to_a
  end

  def match?(arr_item)
    arr_item.chr == arr_item.reverse.chr
  end

  def multiMatch?(item1, item2)
    item1.chr == item2.reverse.chr
  end

  def printList
    sortedList.join.chars.uniq
  end

end
