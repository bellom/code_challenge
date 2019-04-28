# ******************************
# List
# ******************************
class Node
    attr_accessor :value, :next_node
    
    def initialize(value, next_node = nil)
        @value = value
      @next_node = next_node
    end
  end
  
  class LinkedList
    # setup head and tail
    attr_accessor :head, :tail
    
    def initialize
      @head = nil
      @tail = nil
    end
    
    def add(number)
      # your code here
      node = Node.new(number)
      # Inserting first node
      if @head == nil
        @head = node
        @tail = node
      # Inserting rest nodes
      else
        @tail.next_node = node
        @tail = node
      end
    end
  
    def get(index)
      # your code here
      count = 0
      current = @head
  
      while !current.nil? do
        if count == index
          return current.value
        else
          count = count+1
          current = current.next_node
        end
      end
    end
  end
  
  list = LinkedList.new
  
  list.add(3)
  list.add(5)
  puts list.get(1)
  puts list.get(0)
  
# ******************************
# Linked LIst
# ******************************
class Node
    attr_accessor :value, :next_node
    
    def initialize(value, next_node = nil)
        @value = value
      @next_node = next_node
    end
  end
  
  class LinkedList
    # setup head and tail
    attr_accessor :head, :tail
    
    # INIT
    def initialize
      @head = nil
      @tail = nil
    end
    
    # ADD NODE AT END
    def add(number)
      # Create a new node
      node = Node.new(number)
      # Inserting first node
      if @head == nil
        @head = node
        @tail = node
      # Inserting rest nodes
      else
        @tail.next_node = node
        @tail = node
      end
    end
  
    # ADD NODE AT INDEX
    def add_at(index, item)
  
      node = Node.new(item)
      if index == 0
        node.next_node = @head
        @head = node
      else
        prev_node = get_node(index-1)
        current_node = get_node(index)
          
        prev_node.next_node = node
        node.next_node = current_node
      end
    end
    
    # REMOVE NODE AT INDEX
    def remove(index)
      prev_node = get_node(index-1)
      current_node = get_node(index)
      
      prev_node.next_node = current_node.next_node
    end
    
    # FIND NODE AT INDEX
    def get_node(index)
      count = 0
      current_node = @head
      
      while !current_node.nil? do
        if count == index
          return current_node
        else
          count = count + 1
          current_node = current_node.next_node
        end
      end
    end
    
    # FIND VALUE AT INDEX
    def get(index)
      count = 0
      current_node = @head
  
      while !current_node.nil? do
        if count == index
          return current_node.value
        else
          count = count+1
          current_node = current_node.next_node
        end
      end
    end
    
    
  end
  
  
  
  list = LinkedList.new
  
  list.add(3)
  list.add(5)
  list.add(7)
  
  list.add_at(1,10)
  # list.get_node(0)
  
  list.head
  
  # p list.get(0)
  # p list.get(1)

# ******************************
# Stack
# ******************************
class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
	  @value = value
    @next_node = next_node
  end
end

class LinkedList
  # setup head and tail
  attr_accessor :head, :tail
  
  # INIT
  def initialize
    @head = nil
    @tail = nil
  end
  
  # ADD NODE AT END
  def add(number)
    # Create a new node
    node = Node.new(number)
    # Inserting first node
    if @head == nil
      @head = node
      @tail = node
    # Inserting rest nodes
    else
      @tail.next_node = node
      @tail = node
    end
  end

  # ADD NODE AT INDEX
  def add_at(index, item)

    node = Node.new(item)
    if index == 0
      node.next_node = @head
      @head = node
    else
      prev_node = get_node(index-1)
      current_node = get_node(index)
        
      prev_node.next_node = node
      node.next_node = current_node
    end
  end
  
  # REMOVE NODE AT INDEX
  def remove(index)
    prev_node = get_node(index-1)
    current_node = get_node(index)
    
    prev_node.next_node = current_node.next_node
  end
  
  # FIND NODE AT INDEX
  def get_node(index)
    count = 0
    current_node = @head
    
    while !current_node.nil? do
      if count == index
        return current_node
      else
        count = count + 1
        current_node = current_node.next_node
      end
    end
  end
  
  # FIND VALUE AT INDEX
  def get(index)
    count = 0
    current_node = @head

    while !current_node.nil? do
      if count == index
        return current_node.value
      else
        count = count+1
        current_node = current_node.next_node
      end
    end
  end
  
  
end



list = LinkedList.new

list.add(3)
list.add(5)
list.add(7)

list.add_at(1,10)


# Start with your code from LinkedList challenge.
class Stack
  def initialize
    @head = nil
  end

  def push(value)
    @head = Node.new(value, @head)
  end

  def pop
    puts 'no values in the stack' if @head.nil?
    value = @head.value
    @head = @head.next_node
    value
  end

end



list = LinkedList.new

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3

# ******************************
# Queue
# ******************************
class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
	  @value = value
    @next_node = next_node
  end
end

class LinkedList
  # setup head and tail
  attr_accessor :head, :tail
  
  # INIT
  def initialize
    @head = nil
    @tail = nil
  end

  def empty?
    return @head.nil?
  end
  
  # ADD NODE AT END
  def add(number)
    # Create a new node
    node = Node.new(number)
    # Inserting first node
    if @head == nil
      @head = node
      @tail = node
    # Inserting rest nodes
    else
      @tail.next_node = node
      @tail = node
    end
  end

  # ADD NODE AT INDEX
  def add_at(index, item)

    node = Node.new(item)
    if index == 0
      node.next_node = @head
      @head = node
    else
      prev_node = get_node(index-1)
      current_node = get_node(index)
        
      prev_node.next_node = node
      node.next_node = current_node
    end
  end
  
  # REMOVE NODE AT INDEX
  def remove(index)
    if(index===0)
      temp = get_node(0)
      @head = get_node(1)
      return temp.value
    else
      prev_node = get_node(index-1)
      current_node = get_node(index)
      prev_node.next_node = current_node.next_node
      return current_node.value
    end
    
  end
  
  # FIND NODE AT INDEX
  def get_node(index)
    count = 0
    current_node = @head
    
    while !current_node.nil? do
      if count == index
        return current_node
      else
        count = count + 1
        current_node = current_node.next_node
      end
    end
  end
  
  # FIND VALUE AT INDEX
  def get(index)
    count = 0
    current_node = @head

    while !current_node.nil? do
      if count == index
        return current_node.value
      else
        count = count+1
        current_node = current_node.next_node
      end
    end
  end
end

class Queue
  attr_accessor :list
  def initialize
    @list = LinkedList.new
  end

  def add(number)
    # PUSH_BACK
    @list.add(number)
  end
  
  def remove
    # POP_FRONT
    unless @list.empty?
      temp = @list.get_node(0)
      @list.remove(0)
    else
      return -1
    end
  end
end

queue = Queue.new

queue.add(3)
queue.add(5)
puts queue.remove
# => 3

queue.add(2)
queue.add(7)
puts queue.remove
# => 5

puts queue.remove
# => 2

puts queue.remove
# => 7

puts queue.remove
# => -1

puts queue.list

# ******************************
# Min Stack
# ******************************
class Stack

  def initialize
    @stack = []
    @min = nil
  end
  
  def push(number)
    # your code here
    @stack << number
  end
  
  def pop
    # your code here
    @stack.pop
  end
  
  def min
    # your code here
    @stack.min
  end

end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.min
# => 3
 
stack.pop
stack.push(7)
puts stack.min
# => 3 

stack.push(2)
puts stack.min
# => 2

stack.pop
puts stack.min
# => 3

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************