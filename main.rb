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

  #my_select
  def my_select
    return to_enum(:my_each) unless block_given?
    
    choose = []
    my_each { |item| choose.push(item) if yield(item) } 
    choose
  end

  #my_all

  def my_all?(*arr)
    belong = true

    #check it the items belong to the same class
    if !arr[0].nil?
      my_each { |item| belong = false unless arr[0] === item }
    elsif !block_given?
      my_each { |item| belong = false unless item }
    else 
      my_each { |item| belong = false unless yield(item) }
    end
    belong
  end

  #my_any
  def my_any?(*arr)
    belong = true

    #check it the items belong to the same class
    if !arr[0].nil?
      my_each { |item| belong = true if arr[0] === item }
    elsif !block_given?
      my_each { |item| belong = true if item }
    else 
      my_each { |item| belong = true if yield(item) }
    end
    belong
  end
end

# Tests

puts '#my_each'
%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_each { |name| puts name }

puts '#my_each_with_index'
%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_each_with_index { |name, index| puts name if index.odd? }

puts '#my_select'
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_select { |name|  name != 'Aaron' })

puts '#my_all?'
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_all? { |item|  item.length >= 4 })
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_all? { |item|  item.length >= 6 })

puts '#my_any?'
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_any? { |item|  item.length >= 4 })
puts (%w[Jenifar, Aaron, Mike, Tom, Chantelle].my_any? { |item|  item.length >= 6 })


