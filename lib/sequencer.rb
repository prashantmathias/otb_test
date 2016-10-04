class Sequencer

  attr_accessor :list

  def initialize(list)
    @list = list
  end

  def setOrder
    list.gsub(/[=> ]/,"").reverse.split(',')
  end

  def display
    setOrder
  end

end
