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
    pickDoubles.each {|x| raise "Self dependencies spotted" if match?(x)}
  end

  def display
    checkSelfDependencies
    printList
  end

private

  def pickDoubles
    sortedList.select {|x| x.length == 2 }
  end

  def match?(x)
    x.chr == x.reverse.chr
  end

  def printList
    sortedList.join.chars.uniq
  end

end
