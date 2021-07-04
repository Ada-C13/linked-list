# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next, :previous # allow external entities to read or write next node

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
  # Time Complexity: O(1), because inserting in the front only requires a change of reference.
  # Space Complexity: O(1), because no new structures are created.
  def add_first(value)
    if @head.nil?
      @head = @tail = Node.new(value)
    else
      new_node = Node.new(value, @head)
      @head.previous = new_node
      @head = new_node
    end
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n), as searching requires iterating through n number of nodes of the list.
  # Space Complexity: O(1), because no new structures are created.
  def search(value)
    current = @head

    while current != nil
      if current.data == value
        return true
      end

      current = current.next
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n), as searching for the max requires iterating through n number of nodes of the list.
  # Space Complexity: O(1), because no new structures are created.
  def find_max
    current = @head
    
    return nil if current == nil

    max = current.data

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
  # Time Complexity: O(n), as searching for the min requires iterating through n number of nodes of the list.
  # Space Complexity: O(1), because no new structures are created.
  def find_min
    current = @head
    
    return nil if current == nil

    min = current.data

    while current != nil
      if current.data < min
        min = current.data
      end

      current = current.next
    end

    return min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n), as finding length requires iterating through all nodes of the list.
  # Space Complexity: O(1), because no new structures are created.
  def length
    current = @head
    length = 0

    while current != nil
      length += 1
      current = current.next
    end

    return length;
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n), because the list must traversed to find the value at that index.
  # Space Complexity: O(1), because no new structures are created.
  def get_at_index(index)
    current = @head
    current_index = 0

    return nil if current == nil

    while current != nil
      if current_index == index
        return current.data
      end

      current_index += 1
      current = current.next
    end

    return nil
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n), as this would require traversing the entire n length of the list.
  # Space Complexity: O(1), because no new structures are created.
  def visit
    current = @head

    while current != nil
      puts current.data

      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(1), because this would only require changing references around.
  # Space Complexity: O(1), because no new structures are created.
  def delete(value)
    current = @head

    while current != nil
      if current.data == value
        if current.previous != nil
          current.previous.next = current.next
        else
          @head = current.next
          @head.previous = nil
        end
      end

      current = current.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n), because this would be dependent on the size of the list.
  # Space Complexity: O(1), because no new structures are created.
  def reverse
    current = @head

    while current != nil
      temp = current.previous
      current.previous = current.next
      current.next = temp

      current = current.previous
    end

    temp = @head
    @head = @tail
    @tail = temp
  end


  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def find_middle_value
    raise NotImplementedError
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
  # Time Complexity: O(1), because the first node is tracked in head.
  # Space Complexity: O(1), because no new structures are created.
  def get_first
    @head ? @head.data : nil
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(1), because the last node is tracked in tail.
  # Space Complexity: O(1), because no new structures are created.
  def add_last(value)
    current = @tail

    if @head == nil
      @head = @tail = Node.new(value)
    else
      new_node = Node.new(value, nil, current)
      current.next = new_node
      @tail = new_node
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(1), because the last node is tracked in tail.
  # Space Complexity: O(1), because no new structures are created.
  def get_last
    return @tail.data
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
end
