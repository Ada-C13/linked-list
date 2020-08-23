
# Defines a node in the DOUBLY linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  attr_accessor :previous # allow external entities to read or write next node

  def initialize(value, next_node = nil, previous_node = nil)
    @data = value
    @next = next_node
    @previous = previous_node
  end
end

# Defines the DOUBLY linked list
class LinkedList
  attr_accessor :head # allow external entities to read or write next node
  attr_accessor :tail # allow external entities to read or write next node

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
        return
      else
        new_node = Node.new(value, @head, nil)
        @head.previous = new_node
        @head = new_node
        # no change to tail
        return
      end
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      return false if @head.nil?

      current = @head
      while current != nil
        return true if current.data == value
        current = current.next
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_max
      return nil if @head.nil?

      current = @head
      max = @head.data
      while current != nil
        max = current.data if current.data > max
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
      min = @head.data
      while current != nil
        min = current.data if current.data < min
        current = current.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      current = @head
      counter = 0
      while current != nil
        current = current.next
        counter += 1
      end
  
      return counter
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n) where n is either the index or the number of nodes
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?
      counter = 0
      current = @head

      while counter < index
        if current.next.nil?
          return nil
        else
          current = current.next
        end

        counter += 1
      end

      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      current = @head
  
      while current != nil
        print current.data 
        current = current.next
      end
  
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n) (since we need to search for the first node with specified value)
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?

      previous_node = nil
      current = @head
      while current != nil
        if current.data == value
          next_node = current.next

          if current == @head
            @head = next_node
            next_node.previous = nil
          elsif current == @tail
            @tail = previous_node
            previous_node.next = nil
          else
            previous_node.next = next_node
            next_node.previous = previous_node
          end
          return
        end

        previous_node = current
        current = current.next
      end

      return
    end

    # method to reverse the SINGLY linked list: so disregarded @previous in this method!
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      return nil if @head.nil?

      previous_node = nil
      current = @head 
      @tail = @head
    
      while current != nil
        temp = current.next #2 / 3 /4 / nil 
        current.next = previous_node #nil / 1 / 2 / 3
          

        previous_node = current #1 /2 /3/4
        current = temp #2 3 /4 /nil
      end

      @head = previous_node
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      # write other way using two pointers and start second pointer after n
      return nil if @tail.nil?
      counter = n
      current = @tail

      while counter > 0
        if current.previous.nil?
          return nil
        else
          current = current.previous
        end
        counter -= 1
      end

      return current.data
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
      if @head.nil?
        return nil
      else
        return @head.data
      end
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(1) since this linked list has a @tail
    # Space Complexity: O(1)
    def add_last(value)
      if @tail.nil?
        @tail = @head = Node.new(value)
        return
      else
        new_node = Node.new(value, nil, @tail)
        @tail.next = new_node
        @tail = new_node
        # no change to head
        return
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(1) since this linked list has a @tail
    # Space Complexity: O(1)
    def get_last
      if @tail.nil?
        return nil
      else
        return @tail.data
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
