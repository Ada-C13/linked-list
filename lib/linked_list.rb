
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next, :previous, :data # allow external entities to read or write next node

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
    # Time Complexity: O(1), since it will always have direct access to the front of the list
    # Space Complexity: O(1)
    def add_first(value)
      if @head == nil
        newNode = Node.new(value)
        @head = newNode
        return
      end

      current_head = @head
      newNode = Node.new(value, next_node = current_head)
      current_head.previous = newNode
      @head = newNode
      return
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n), n being up to the length of the linked list
    # Space Complexity: O(1)
    def search(value)
      return false if @head == nil
      return true if @head.data == value
        
      current_node = @head
      until current_node == nil
        if current_node.data == value
          return true
        else
          current_node = current_node.next
        end
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n), n being up to the length of the linked list
    # Space Complexity: O(1)
    def find_max
      return nil if @head == nil

      current_node = @head
      max_value = current_node.data
      until current_node == nil
        if current_node.data > max_value
          max_value = current_node.data
        end
        current_node = current_node.next
      end

      return max_value
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n), n being up to the length of the linked list
    # Space Complexity: O(1)
    def find_min
      return nil if @head == nil

      current_node = @head
      min_value = current_node.data
      until current_node == nil
        if current_node.data < min_value
          min_value = current_node.data
        end
        current_node = current_node.next
      end

      return min_value
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n), n being the length of the linked list
    # Space Complexity: O(1)
    def length
      return 0 if @head == nil

      current_node = @head
      length = 0
      until current_node == nil
        length += 1
        current_node = current_node.next
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n), n being the index to get the value at
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head == nil

      current_node = @head
      current_index = 0
      until current_node == nil
        if current_index == index
          return current_node.data
        end
        current_index += 1
        current_node = current_node.next
      end

      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n), n being the amount of nodes
    # Space Complexity: O(1)
    def visit
      return nil if @head == nil

      current_node = @head
      until current_node == nil
        current_node = current_node.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n), n being up to the the amount of nodes in the list
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head == nil

      current_node = @head
      previous_node = nil
      next_node = current_node.next
      until current_node == nil
        if current_node.data == value
          # if first node is being deleted
          if previous_node == nil
            next_node.previous = nil
            @head = next_node
            return
          end

          # if last node is deleted
          if next_node == nil
            previous_node.next = nil
            return
          end

          next_node.previous = previous_node
          previous_node.next = next_node
          return
        end
        current_node = current_node.next
        next_node = current_node.next
        previous_node = current_node.previous
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n), n being the number of nodes in the list
    # Space Complexity: O(1)
    def reverse
      return if @head == nil

      length = self.length
      current_node = @head

      until length == 0
        next_node = current_node.next
        current_node.next = current_node.previous
        current_node.previous = next_node
        current_node = next_node if next_node != nil
        length -= 1
        if next_node == nil
          @head = current_node
        end
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
      return nil if @head == nil
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
