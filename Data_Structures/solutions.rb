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
# Sliding Maximum
# ******************************
def sliding_maximum(k, array)
  # your code here
   array.each_cons(k).map(&:max)
end

sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]

# ******************************
# Balanced Brackets
# ******************************
def balanced_brackets?(s)
  # your code here
    left = '{[('
    right = ')]}'
    hash = {'{' => '}', '(' => ')', '[' => ']'}
    stack = []
    
    s.each_char do |c|
        if left.include? c
            stack.push c
        elsif right.include? c
            return false unless hash[stack.pop] == c
        end
    end
    
    return stack.length > 0 ? false : true
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true

# ******************************
# Transposition
# ******************************
def transpose(string)
  # your code here
  while string.include?("gn") 
    string.gsub!("gn","ng")
  end
  string
end

puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg

# ******************************
# Stacks or Recursion
# ******************************
def tree_height(tree_as_list)
  # your code here
  height = 0
  stack = []
  for i in tree_as_list
    stack.push(i)
    if 2**height == stack.length
      height += 1
      stack = []
    end
  end
  height
end

puts tree_height([2, 7, 5, 2, 6, 0, 9])

# ******************************
# Basic Recursion
# ******************************
def sum(number)
  # Your code here
  number == 0 ? 0 : number + sum(number - 1)
end

puts sum(4)
puts sum(10)

# def fib(n)
#     n < 2 ? n : fib(n-1) + fib(n-2)
# end
 
# puts fib(6)

# ******************************
# Binary Search
# ******************************
def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  # Your code here
  sRoot = (min_interval + max_interval) / 2
  
  if sRoot == number/sRoot
    return sRoot
  elsif sRoot > number/sRoot 
    sqrt_recursive(number,min_interval,sRoot)
  else
    sqrt_recursive(number,sRoot,max_interval)
  end
end

puts sqrt(25)
puts sqrt(7056)

# ******************************
# Towers of Hanoi - Part 1
# ******************************
def move(starting, goal)
  # your code here
  middle = 6 - starting - goal
  
  mov = "#{starting}->#{middle}"
  mov += " #{starting}->#{goal}"
  mov += " #{middle}->#{goal}"
  
  mov
end

puts move(1, 3)
# => 1->2 1->3 2->3

puts move(2, 3)
# => 2->1 2->3 1->3

# ******************************
# Towers of Hanoi - Part 2
# ******************************
def hanoi_steps(number_of_discs)
  TOH(number_of_discs, 1, 2, 3)
end

def TOH(n, a, b, c)
  if n>0
    TOH(n-1, a, c, b)
    puts "#{a}->#{c}"
    TOH(n-1, b, a, c)
  end
end


hanoi_steps(2)
# => 1->2 
#    1->3 
#    2->3

hanoi_steps(3)
# => 1->3 
#    1->2
#    3->2
#    1->3
#    2->1
#    2->3
#    1->3

hanoi_steps(4)
# => 1->2
#    1->3
#    2->3
#    1->2
#    3->1
#    3->2
#    1->2
#    1->3
#    2->3
#    2->1
#    3->1
#    2->3
#    1->2
#    1->3
#    2->3
# ******************************
# Backtracking Recursion
# ******************************
def exact_sum?(k, coins)
  #write your code here
  return true if k == 0
  return false if coins.empty? || k < 0
    
  exact_sum?(k-coins[0], coins[1..-1]) || exact_sum?(k, coins[1..-1])

end

puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true
puts exact_sum?(11, [1, 5, 9, 13])
# => false

# ******************************
# Trees
# ******************************
def leftmost_nodes_sum(array)
  # your code here
  sum = 0; i = 0 
  while i < array.length 
    sum += array[i]
    i = (2 * i + 1)
  end
    sum
end

puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
# => 11
# ******************************
# Tree Traversal
# ******************************
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

def pre_order(node)
  if node == nil
    return ''
  end

  result = "#{node.data} "
  result += pre_order(node.left)
  result += pre_order(node.right)
end

def post_order(node)
  # your code here
  if node == nil
    return ""
  end
    result = post_order(node.left)
    result += post_order(node.right)
    result += "#{node.data} "
end

tree = array_to_tree([10, 1, 2, 3, 4, 5, 6], 0)
puts post_order(tree)
#=> 3 4 1 5 6 2 10

# ******************************
# Binary Search Tree
# ******************************
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def pre_order(node)
  if node == nil
    return ''
  end

  result = "#{node.data} "
  result += pre_order(node.left)
  result += pre_order(node.right)
end

def binary_search_tree(array)
  # your code here
  tree = nil
  array.each do |key|
    if tree == nil
      tree = Node.new(key)
    else 
      insert(tree, key)
    end
  end
  
  pre_order(tree).to_s.strip
end

def insert(node, value)
  if node.nil?
    node = Node.new(value)
  end
  if value > node.data
    node.right = insert(node.right, value)
  elsif value < node.data
    node.left = insert(node.left, value)
  end
  node
end

binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"

# ******************************
# Graphs
# ******************************
def graph(hash_graph)
  # write your code here
  current_vertx = 0
  verties = [0]
  while current_vertx != 4 do
    current_vertx = hash_graph[current_vertx][0]
    verties << current_vertx
  end
  return verties
end

hash = { 
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]
}

p graph(hash)
# => [0, 2, 5, 4]


# ******************************
# Breadth-First Search
# ******************************
def bfs(graph)
  # write your code here
  queue = [0]
  result = []
  v_arr = []
  until queue.empty? do
    first = queue.shift
    result << first
    v_arr << first
    
    nv_arr = graph[first].reject {|i| v_arr.include? i}
    v_arr += nv_arr
    queue += nv_arr
  end
  result
end

p bfs({
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]
})
# => [0, 2, 5, 3, 4, 1]

# ******************************
# Depth-First Search
# ******************************
def depth_first_search(graph)
  result = []
  stack = [0]
  
  while !stack.empty? do
    first = stack.shift
    if !result.include?(first)
      result << first
      stack.unshift(graph[first] - result).flatten!
    end
  end
  result
end

p depth_first_search({
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]
})

# ******************************
# How Tall is the Tree?
# ******************************
def binary_tree_height(array_tree)
  result = []
  i = 0
  while i < array_tree.length
    i = 2*i+1
    result << i
  end
  result.length
end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9])
# # => 3

# ******************************
# Is it a Search Tree?
# ******************************
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

def search_tree?(array_tree)
  # write your code here
  tree = array_to_tree(array_tree, 0)
  
  in_order_array = in_order(tree)
  
  in_order_array == in_order_array.sort
end

def in_order(node)
  if node == nil
    return []
  end

  result = in_order(node.left)
  result << node.data
  result += in_order(node.right)
end

puts search_tree?([10, 4, 12])
# => true

puts search_tree?([10, 5, 7])
# => false

# ******************************
# Is it balanced?
# ******************************
class Node
  attr_reader :data
  attr_accessor :left, :right
  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0
  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)
  node
end

def maximum(a,b)
   a >= b ? a : b 
end 

def minimum(a,b)
   a <= b ? a : b 
end

def height(node)
  if node == nil
    return 0
  end
  return 1 + maximum(height(node.left),height(node.right))
end

def balanced_tree?(array_tree)
  # write your code here
  tree = array_to_tree(array_tree, 0)
  is_balanced(tree)
end

def is_balanced(node)
  if node == nil  
        return true
  end      
  lh = height(node.left)
  rh = height(node.right)
  if maximum(lh,rh)- minimum(lh,rh) <= 1 && is_balanced(node.left) && is_balanced(node.right)
    return true
  end  
  return false
end  

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true

# ******************************
# connected components
# ******************************

def connected_graph?(graph)

  # current_node = 0
  visited = []
  queue = [0]
  
  while !queue.empty? do
    current_node = queue.shift
    visited << current_node
    
    queue << (graph[current_node] - visited)
    # flatten! returns a new array that is a one-dimensional flattening of this array
    queue.flatten!
    # uniq! returns a new array by removing duplicate values in self
    queue.uniq!
  end
  
  (graph.keys - visited).empty?
end

# ******************************
# find the cycles
# ******************************
def graph_cycle?(graph)
  stack = [0]
  cycle = []
  
  while !stack.empty? do
    current_node = stack.shift
     if !cycle.include?(current_node)
      cycle << current_node
      stack.unshift(graph[current_node] - cycle) unless graph[current_node].nil?
      stack.flatten!
     else
       return true
     end
  end
  false
end


puts graph_cycle?({
  0=>[2], 
  1=>[4], 
  2=>[0, 5, 3], 
  3=>[5, 2], 
  4=>[5, 1], 
  5=>[4, 2, 3]
})
# => true

puts graph_cycle?({
  0=>[2], 
  1=>[2], 
  2=>[0, 1, 3, 4, 5], 
  3=>[2], 
  4=>[2]
})
# => false

# ******************************
# Greatest peak's
# ******************************



# ******************************
# explorer_maze
# ******************************
def maze_escape(maze)
  # write your code here
  nodes_to_visit = [[0,0]]
  visited = []
  
  distance = { 0 => 0 }
  predecessor = { 0 => 0 }
  (1...maze.size*maze.size).each do |i| 
    distance[i] = maze.size * maze.size
    predecessor[i] = nil
  end
  
  while !nodes_to_visit.empty? do
    current_node = nodes_to_visit.shift;
    neighboors = get_neighboors(current_node, maze.size)
    
    neighboors_to_add = neighboors.reject {|pos| visited.include?(pos) || nodes_to_visit.include?(pos)}
    neighboors_to_add = neighboors_to_add.reject {|pos| maze[pos[0]][pos[1]] == 1}
    
    
    neighboors_to_add.each do |pos|
      if (distance[get_index(pos, maze.size)].nil? || 
            distance[get_index(pos, maze.size)] > distance[get_index(current_node, maze.size)] + 1)
        distance[get_index(pos, maze.size)] = distance[get_index(current_node, maze.size)] + 1
        predecessor[get_index(pos, maze.size)] = current_node
      end
    end
    
    visited << current_node
    nodes_to_visit += neighboors_to_add
  end

  # find the position of 9
  goal_index = maze.flatten.index(9)
  
  # p predecessor
  
  # construct the result
  node = goal_index
  result = [[node/maze.size, node%maze.size].reverse]
  while node != 0
    result.unshift(predecessor[node].reverse)
    node = get_index(predecessor[node], maze.size) unless predecessor[node].nil?
    
    break if predecessor[node].nil?
  end
  # result.unshift([node/maze.size, node%maze.size])
  
  return result
end

def get_neighboors(pos, size) 
  neighboors = []
  i,j = pos[0], pos[1]
  
  neighboors << [i-1, j] unless i == 0
  neighboors << [i, j+1] unless j == size - 1
  neighboors << [i+1, j] unless i == size - 1
  neighboors << [i, j-1] unless j == 0
  
  return neighboors
end

def get_index(pos, size) 
  return pos[0]*size + pos[1]  
end


# ******************************
# Sets
# ******************************
require 'set'

def find_duplicates(array)
  # write your code here
  result = Set.new
  dup = []
  array.each do |i| 
    if result.include?(i) ? dup << i : result.add(i)
    end
  end
  dup
end

p find_duplicates([1, 2, 3, 1, 5, 6, 7, 8, 5, 2])
# => [1, 5, 2]

# ******************************
# Maps
# ******************************
def appears_most_times(array)
  # write your code here
  map = Hash.new
  
  array.each do |i| 
    if map.key?(i) ? map[i] += 1 : map[i] = 1
    end
  end
  map.key(map.values.max )
end

puts appears_most_times([1, 2, 3, 1, 5])
# => 1

# ******************************
# Hash Tables
# ******************************
def hash_table(arr)
  arr.sort_by{|i| i.abs % 11}
end

# OR 

def hash_table(arr)
  hash_table = []
  
  arr.each do |i|
    key = i.abs % 11
    if hash_table[key]
      hash_table[key] << i 
    else 
      hash_table[key] = [i]
    end
  end
    hash_table.compact.flatten
end

p hash_table([12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10])
# => [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

p hash_table([2, 341, 73, 8265, 234004, 602, 7400000, 200000000])
# => [341, 234004, 2, 200000000, 7400000, 8265, 73, 602]


# ******************************
# Prime Number
# ******************************
require 'set'
require 'prime'

def number_of_primes(arr)
  num = 10000
  primes = Prime::EratosthenesGenerator.new.take_while {|i| i <= num}
  
  arr.count {|i| primes.include?(i)}
end


puts number_of_primes([2, 3, 5, 6, 9])
# => 3

puts number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 4

puts number_of_primes([7, 6, 7, 3, 77, 14, 28, 35, 42])
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

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************

# ******************************
# Linked LIst
# ******************************