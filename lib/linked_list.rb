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
    @head = nil # keep the head private. Not accessible outside this class
    @tail = nil
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def add_first(value)
    if @head.nil?
      @head = @tail = Node.new(value)
    else
      new_node = Node.new(value, @head)
      @head = new_node
    end
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def search(value)
    if @head.nil?
      return false
    else
      current = @head
      until current.nil?
        if current.data == value
          return true
        end
        current = current.next
      end
      return false
    end
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    if @head.nil?
      return nil
    else
      current = @head
      highest = @head
      until current.nil?
        if current.data > highest.data
          highest = current
        end
        current = current.next
      end
      return highest.data
    end
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: ?
  # Space Complexity: ?
  def find_min
    if @head.nil?
      return nil
    else
      current = @head
      lowest = @head
      until current.nil?
        if current.data < lowest.data
          lowest = current
        end
        current = current.next
      end
      return lowest.data
    end
  end

  # method that returns the length of the singly linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def length
    length = 0
    if @head.nil?
      return length
    else
      current = @head
      until current.nil?
        length += 1
        current = current.next
      end
      return length
    end
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: ?
  # Space Complexity: ?
  def get_at_index(index)
    if @head.nil?
      return nil
    else
      array_index = 0
      current = @head
      until current.nil?
        if index == array_index
          return current.data
        end
        array_index += 1
        current = current.next
      end
      return nil
    end
  end

  # method to print all the values in the linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def visit
    raise NotImplementedError
  end

  # method to delete the first node found with specified value
  # Time Complexity: ?
  # Space Complexity: ?
  def delete(value)
    if @head.nil?
      return
    elsif @head.data == value
      @head = @head.next
    else
      current = @head
      until current.next.nil?
        if current.next.data == value
          current.next = current.next.next
        else
          current = current.next
        end
      end
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: ?
  # Space Complexity: ?
  def reverse
    if @head.nil?
      return nil
    else
      current = @head
      previous = nil 
      temp = current.next 
      until current.next.nil?
        temp = current.next 
        current.next = previous
        previous = current 
        current = temp 
      end
      current.next = previous
      @head = current
    end
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
    if @head.nil?
      return nil
    else
      current = @head
      i = 0 
      trailing_current = @head
      until current.nil?
        if i > n 
          trailing_current = trailing_current.next
        elsif current.next.nil? && n > i
          return nil 
        end
        current = current.next 
        i += 1
      end
      return trailing_current.data
    end
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
  # Time Complexity: ?
  # Space Complexity: ?
  def get_first
    if @head.nil?
      return nil
    else
      return @head.data
    end
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def add_last(value)
    current = @head
    if current.nil?
      add_first(value)
      return
    else
      until current.next.nil?
        current = current.next
      end
      current.next = Node.new(value)
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: ?
  # Space Complexity: ?
  def get_last
    if @head.nil?
      return nil
    else
      current = @head
      until current.next.nil?
        current = current.next
      end
      return current.data
    end
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
