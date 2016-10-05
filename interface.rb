require './lib/list_output'

puts "Enter a list of jobs with or without dependencies(eg. 'a =>,b => ,c =>' or 'a => ,b => c, c'):"
@list = gets.chomp.to_s
sequence = ListOutput.new(@list)
print "Job sequence: #{sequence.display} \n"
