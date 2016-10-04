# Initial spiked solution

```
def setOrder(list)
  setup = list.gsub(/[=> ]/,"").reverse.split(',')
  sorting =  setup.sort {|a,b| b <=> a}.select {|x| x.length == 2 }
  spotsd =  sorting.each {|x| raise "Self dependencies spotted" if x.chr == x.reverse.chr}
  spotcd = sorting.combination(2).to_a.each { |x| raise "Circular dependencies spotted" if x[0].chr == x[1].reverse.chr }
  printout = setup.join.chars.uniq
end


#setOrder("a => , b => c, c => f, d => a, e => b, f => ")
#setOrder("a => , b => c , c => ")
#setOrder("a => , b => c, c => f, d => a, e => , f => b")

```
