
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  attr_accessor :previous

  def initialize(value, next_node = nil, prev_node = nil)
    @data = value
    @next = next_node
    @previous = prev_node
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
      current_node = @head

      until current_node.nil?
        return true if current_node.data == value

        current_node = current_node.next
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_max
      current_node = @head
      max_value = current_node.data unless current_node.nil?

      until current_node.nil?
        max_value = current_node.data if current_node.data > max_value

        current_node = current_node.next
      end

      return max_value
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      current_node = @head
      min_value = current_node.data unless current_node.nil?

      until current_node.nil?
        min_value = current_node.data if current_node.data < min_value

        current_node = current_node.next
      end

      return min_value
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      current_node = @head
      length = 0

      until current_node.nil?
        length += 1

        current_node = current_node.next
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      length = self.length
      return nil if length <= index
      return @head.data if index == 0

      current_index = 0
      current_node = @head

      until current_index == index
        current_index += 1
        current_node = current_node.next
      end

      return current_node.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def visit
      return nil if @head.nil?
      current_node = @head

      until current_node.nil?
        puts current_node.data

        current_node = current_node.next
      end

      return
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return if @head.nil?

      if @head.data == value
        @head = nil if @head.next.nil?
        @head = @head.next unless @head.nil?
        return
      end

      current_node = @head
      previous_node = @head.previous

      until current_node.nil?
        if current_node.next.nil?
          @tail = previous_node
          previous_node.next = nil
          return 
        end

        next_node = current_node.next

        if current_node.data == value
          
          next_node.previous = previous_node
          previous_node.next = next_node
          @tail = next_node if next_node.next.nil?
          return
        end
        
        previous_node = current_node
        current_node = current_node.next
      end

      return
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O()
    # Space Complexity: O(n)
    def reverse
      return if @head.nil?
      return if @head.next.nil?
      temp = @tail
      @tail = @head
      @head = temp

      #TODO: use recursion
      return
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
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      length = self.length
      return nil if length <= n
      return @head.data if n == 0
      return @tail.data if n == length - 1

      current_index = length - 1
      current_node = @tail

      until current_index == n
        current_index -= 1
        current_node = current_node.previous
      end

      return current_node.data
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
      return @head.data unless @head.nil?
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def add_last(value)
      if @head.nil?
        @head = @tail = Node.new(value)
      else
        new_node = Node.new(value)
        @tail.next = new_node
        new_node.previous = @tail
        @tail = new_node
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_last
      return @tail.data unless @tail.nil?
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
