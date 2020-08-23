
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
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def add_first(value)
      new_node = Node.new(value, @head)
      @head = new_node
      return @head
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      current = @head
      while (!current.nil? && current.data != value) do
        current = current.next
      end
      return !current.nil?
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_max
      return nil if @head.nil?
      current = @head
      max = current.data
      while !current.nil? do
        max = current.data if max < current.data
        current = current.next 
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?
      current = @head
      min = current.data
      while !current.nil? do
        min = current.data if min > current.data
        current = current.next 
      end
      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      count = 0
      current = @head
      while !current.nil?
        count += 1
        current = current.next
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      current_index = 0
      current = @head
      while (current_index < index && !current.nil?) do
        current_index += 1
        current = current.next
      end
      if current.nil?
        return nil
      else
        return current.data
      end
  end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      node = @head
      while node.next do
        print node.data, " "
        node = node.next
      end
      puts node.data
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      current = @head
      previous = nil
      while (!current.nil? && current.data != value) do
        previous = current
        current = current.next
      end
      if current.nil?
        return false
      else
        if previous.nil?
          @head = current.next
        else
          previous.next = current.next
        end
        return true
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      return if @head.nil? || @head.next.nil? 
      previous = nil
      current = @head
      while !current.nil? do
        temp = current.next
        current.next = previous
        previous = current
        current = temp
      end
      @head = previous
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_middle_value
      return get_at_index(length/2)
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return get_at_index(length - n - 1)
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
      return @head.nil? ? nil : @head.data
      end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      return add_first(value) if @head.nil?
      current = @head
      while !current.next.nil?
        current = current.next
      end
      new_node = Node.new(value)
      current.next = new_node
      return new_node 
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      return nil if @head.nil?
      current = @head
      while !current.next.nil?
        current = current.next
      end
      return current.data
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
