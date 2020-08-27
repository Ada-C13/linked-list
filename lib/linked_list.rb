
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside self class
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add_first(value)
    if @head
      second = @head
      @head = Node.new(value, second)
    else
      @head = Node.new(value)
    end
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    if @head == nil
      return false
    end
    return search_help(value) != nil
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    if @head == nil
      return nil
    end
    max = @head.data
    current = @head
    while current != nil
      if current.data > max
        max = current.data
      end
      current = current.next
    end
    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    if @head == nil
      return nil
    end
    min = @head.data
    current = @head
    while current != nil
      if current.data < min
        min = current.data
      end
      current = current.next
    end
    return min
  end


  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    if @head == nil
      return 0
    end
    current = @head
    length = 0
    while current != nil
      length += 1
      current = current.next
    end
    return length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    node = get_node_at_index(index)
    if node
      return node.data
    else
      return nil
    end
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def visit
    current = @head
    while current != nil
      puts current.data
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def delete(value)
    target = search_help(value)
    after_target = target.next
    target.next = nil
    before_target_index = self.length - 2
    before_target = get_node_at_index(before_target_index)
    before_target.next = after_target
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def reverse
    new_list = LinkedList.new
    current = @head
    while current != nil
      new_list.add_first(current)
      current = current.next
    end
    @head.next = nil
    @head = new_list.get_first
  end


  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_middle_value
    length = self.length
    middle_index = length/2
    return get_at_index(middle_index)
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_nth_from_end(n)
    length = self.length
    nth_from_end_index = length - 1 - n
    return get_at_index(nth_from_end_index)
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: ?
  # Space Complexity: ?
  def has_cycle
    current = @head
    seen_nodes = []
    # while current != nil || has_node?(current)
    #   current = current.next
    #   if current == nil
    #     return false
    #   end
    #   if has_node
    # end
  end
  def has_node?(array, node)
    array.each do |current_node|
      if current_node == node
        return true
      end
    end
    return false
  end


  # Additional Exercises 
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: ?
  # Space Complexity: ?
  def get_first
    if @head
      return @head
    else
      return nil
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def add_last(value)
    raise NotImplementedError
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: ?
  # Space Complexity: ?
  def get_last
    raise NotImplementedError
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: ?
  # Space Complexity: ?
  def insert_ascending(value)
    raise NotImplementedError
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

  private

  def get_node_at_index(index)
    length = self.length
    if length < index
      return nil
    end
    current = @head
    (0..(length-1)).each do |i|
      if i == index
        return current
      end
      current = current.next
    end
    return nil
  end

  def search_help(value)
    current = @head
    while current != nil
      if current.data == value
        return current
      else
        current = current.next
      end
    end
    return nil
  end

end
