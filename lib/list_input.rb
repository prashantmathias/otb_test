class ListInput

  def initialize(list)
    @list = list
  end

  def sorted_list
    list_setup.sort {|a,b| b <=> a}
  end

private

  attr_reader :list

  def list_setup
    list.gsub(/[=> ]/,"").reverse.split(',')
  end

end
