
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  attr_accessor :previous # allow external entities to read or write previous node
  
  def initialize(value, next_node = nil, previous_node = nil) 
    @data = value
    @next = next_node
    @previous = previous_node
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
    @tail = nil
  end
  
  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add_first(value)
    if @head == nil
      @head = @tail = Node.new(value)
    else
      new_node = Node.new(value, next_node = @head)
      @head.previous = new_node
      @head = new_node
    end
  end
  
  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    return false if @head.nil?
    return true if @head.data == value
    
    current = @head
    while (current = current.next)
      return true if current.data == value
    end
    
    return false
  end
  
  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_max
    return nil if @head.nil?
    
    max = @head.data
    current = @head
    
    while (current = current.next)
      if current.data > max
        max = current.data
      end
    end
    
    return max
  end
  
  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    return nil if @head.nil?
    
    min = @head.data
    current = @head
    
    while (current = current.next)
      if current.data < min
        min = current.data
      end
    end
    
    return min
  end
  
  
  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    return 0 if @head.nil?
    return 1 if @head.next.nil?
    
    current = @head
    count = 1
    while (current = current.next)
      count += 1
    end
    return count
  end
  
  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    return nil if @head.nil?
    
    count = 0
    current = @head
    until count == index
      current = current.next
      count += 1
    end
    
    return current.data
  end
  
  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def visit
    if @head.nil?
      puts 'list is empty' 
      return
    end
    
    current = @head
    while current != nil
      puts current.data
      current = current.next
    end
  end
  
  # method to delete the first node found with specified value
  # Time Complexity: To find the node: O(n), to delete O(1)
  # Space Complexity: O(1)
  def delete(value)
    return if @head.nil?
    
    # if head == value, reassign new head's previous to nil, head to current head's next
    if @head.data == value
      @head.next.previous = nil
      @head = @head.next
    end
    
    # if tail == value, reassign tail current tail's previous, reassign new tail's next to nil
    if @tail.data == value
      @tail = @tail.previous
      @tail.next = nil
    end
    
    # otherwise, traverse the list and hunt for the value you're looking for & reassign
    current = @head
    while (current = current.next)
      if current.data == value
        current.next.previous = current.previous
        current.previous.next = current.next
      end
    end
    
    return nil # in the case your value is not located in the list
  end
  
  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def reverse
    temp = nil
    current = @head
    
    while current != nil
      temp = current.previous
      current.previous = current.next
      current.next = temp
      current = current.previous
    end
    
    if temp != nil
      @tail = @head
      @head = temp.previous
    end
  end
  
  
  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_middle_value
    return nil if @head.nil?

    length = self.length
    index = length/2
    return self.get_at_index(index)
  end
  
  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: ?
  # Space Complexity: ?
  def find_nth_from_end(n)
    raise NotImplementedError
  end
  
  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: ?
  # Space Complexity: ?
  def has_cycle
    raise NotImplementedError
  end
  
  
  # Additional Exercises 
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def get_first
    return nil if @head == nil
    return @head.data
  end
  
  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add_last(value)
    if @tail.nil?
      add_first(value)
    else
      new_tail = Node.new(value)
      new_tail.previous = @tail
      @tail.next = new_tail
      @tail = new_tail
    end
  end
  
  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def get_last
    return nil if @tail == nil
    return @tail.data
  end
  
  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: ?
  # Space Complexity: ?
  def insert_ascending(value)
    if @head == null
      @head = Node.new(value)
      return
    end

    if @head.data > value
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node
      return
    end

    if @tail.data < value
      new_node = Node.new(value)
      @tail.next = new_node
      new_node.previous = @tail
      @tail = new_node
      return
    end

    current = @head
    while (current = current.next)
      if value > current.value && value < current.next.value
        new_node = Node.new(value)
        current.next = new_node
        new_node.previous = current
        new_node.next = current.next
        current.previous = new_node
        return
      end
    end
  end
  
  # Helper method for tests
  # Creates a cycle in the linked list for testing purposes
  # Assumes the linked list has at least one node
  def create_cycle
    return if @head == nil # don't do anything if the linked list is empty
    
    # navigate to last node
    current = @head
    while current.next != nil
      current = current.next
    end
    
    current.next = @head # make the last node link to first node
  end
end
