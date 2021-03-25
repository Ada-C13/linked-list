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
      @head = Node.new(value, @head)
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      return false if @head.nil?

      current = @head
      current_index = 0
      current_value = @head.data
      while (current_index < (self.length)  && !current.nil?)
        if current_value == value
          return true
        elsif current_index != (self.length - 1)
          current = current.next
          current_value = current.data
          current_index += 1
        else
          return false
        end
      end
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?

      current = @head
      current_index = 0
      max_value = @head.data
      current_value = @head.data
      while (current_index < (self.length)  && !current.nil?)
        if current.data > max_value
          max_value = current_value
        end
        if current.next.nil?
          return max_value
        end
        current = current.next
        current_value = current.data
        current_index += 1
      end
      return max_value
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?
      
      current = @head
      current_index = 0
      min_value = @head.data
      current_value = @head.data
      while (current_index < (self.length)  && !current.nil?)
        if current.data < min_value
          min_value = current_value
        end
        if current.next.nil?
          return min_value
        end
        current = current.next
        current_value = current.data
        current_index += 1
      end
      return min_value
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      return 0 if @head.nil?

      current = @head
      count = 0
      until current.nil?
        current = current.next
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
      return nil if index > self.length
      
      current = @head
      current_index = 0
      while (current_index < index  && !current.nil?)
        current_index += 1
        current = current.next
      end

      return current.data
    end
    
    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      return nil if @head.nil?

      current = @head
      current_index = 0
      while (current_index < self.length  && !current.nil?)
        print current.data
        current_index += 1
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?

      # if head node is node to be deleted, change head
      if @head.data == value
        @head = @head.next
      end

      current = @head
      while !current.next.nil?
        if current.next.data == value
          current.next = current.next.next
          return
        end
        current = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      current = @head
      previous = nil
      temp = current.next
      
      until current.nil?
        temp = current.next
  
        current.next = previous

        previous = current
        current = temp
      end

      @head = previous
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
    # Time Complexity: ?
    # Space Complexity: ?
    def get_first
      return nil if @head.nil?
      return @head.data
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
end
