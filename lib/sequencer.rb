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

  def display
    sortedList.join.chars.uniq
  end

end
