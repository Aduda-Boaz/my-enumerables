module Enumerable
   # my_each method
   def my_each
    # Enumerator is returned when a block is not given
    return to_enum(:my_each) unless block_given?
    
    ticket = is_a?(Range) ? to_a : self

    spread = 0
    while spread < ticket.length 
      yield(ticket[spread])
      spread += 1
    end
    ticket
  end

   # my_each_with_index
   def my_each_with_index
    # Enumerator is returned when a block is not given
    return to_enum(:my_each) unless block_given?
    
    ticket = is_a?(Range) ? to_a : self

    spread = 0
    while spread < ticket.length 
      yield(ticket[spread], spread)
      spread += 1
    end
    ticket
  end



end

# Tests

puts '#my_each'
%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_each { |friends| puts friends }

puts '#my_each_with_index'
%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_each_with_index { |friends, index| puts friends if index.even? }


