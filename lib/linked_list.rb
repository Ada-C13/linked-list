
# Defines a node in the doubly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  attr_accessor :previous

  def initialize(value, next_node = nil, previous = nil)
    @data = value
    @next = next_node
    @previous = previous
  end
end

# Defines the doubly linked list
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
      if @head.nil?
        @head = @tail = Node.new(value)
      else
        new_node = Node.new(value)
        new_node.next = @head
        @head.previous = new_node
        @head = new_node
      end
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      current = @head
      until current == nil
        return true if current.data == value
        current = current.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?
      max = @head.data
      current = @head.next
      until current == nil
        if current.data > max
          max = current.data
        end
        current = current.next
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: ?
    # Space Complexity: ?
    def find_min
      return nil if @head.nil?
      min = @head.data
      current = @head.next
      until current == nil
        if current.data < min
          min = current.data
        end
        current = current.next
      end
      return min
    end


    # method that returns the length of the doubly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      return 0 if @head.nil?
      counter = 0
      current = @head
      until current == nil
        counter += 1
        current = current.next
      end
      return counter
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?
      counter = 0
      current = @head
      until current.nil?
        return current.data if counter == index
        counter += 1
        current = current.next
      end
      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      current = @head
      until current.nil?
        puts current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?

      if @head.data == value 
        @head = @head.next
        @head.previous = nil
      elsif @tail.data == value
        @tail = @tail.previous
        @tail.next = nil
      else
        current = @head
        until current == nil
          if current.data == value
            current.previous.next = current.next
            current.next.previous = current.previous
          end
          current = current.next
        end
      end
    end

    # method to reverse the doubly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: ?
    # Space Complexity: ?
    def reverse
      min = 0
      max = length

      i = @head
      j = @tail

      while min < max
        temp = i
        i = j
        j = temp
        min += 1
        max -= 1
      end

    end


    ## Advanced Exercises
    # returns the value at the middle element in the doubly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return nil if @head.nil?
      counter = 0
      current = @tail
      until current.nil?
        return current.data if counter == n
        counter += 1
        current = current.previous
      end
      return nil
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
      @head.nil? ? nil : @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def add_last(value)
      if @head.nil?
        @head = @tail = Node.new(value)
      else
        new_node = Node.new(value)
        new_node.previous = @tail
        @tail.next = new_node
        @tail = new_node
      end 
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_last
      @tail.nil? ? nil: @tail.data
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
