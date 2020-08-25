
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next, :data # allow external entities to read or write next node

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
    # Time Complexity: O(1) bc it only adds one thing regardless of how big the list is
    # Space Complexity: O(1)
    def add_first(value)
      if @head.nil? 
        @head = Node.new(value)
      else 
        @head = Node.new(value, @head) 
      end
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n) because worst case it needs to run through all items in list 
    # Space Complexity: O(1)
    def search(value)
      return false if @head.nil? 

      pointer = @head 

      until pointer.nil?
        if pointer.data == value
          return true 
        end 
        pointer = pointer.next 
      end

      return false 
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?

      pointer = @head
      max = @head.data

      until pointer.nil?
        if pointer.data > max 
          max = pointer.data
        end
        pointer = pointer.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) bc it has to run through every item 
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?

      pointer = @head
      min = @head.data

      until pointer.nil?
        if pointer.data < min
          min = pointer.data
        end 
        pointer = pointer.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n) bc it has to run through every item 
    # Space Complexity: O(1)
    def length
      return 0 if @head.nil?

      count = 1 
      pointer = @head 
      
      until pointer.next.nil?
        pointer = pointer.next 
        count += 1 
      end

      return count 
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n) could possibly have to run through every item in list
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?

      pointer = @head
      pointer_index = 0
      until pointer.nil?
        if pointer_index == index
          return pointer.data
        end
        pointer_index += 1
        pointer = pointer.next
      end

      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n) bc it has to go thru every item on the list
    # Space Complexity: O(1)
    def visit
      return nil if @head.nil?

      pointer = @head 

      until pointer.nil? 
        puts pointer.data
        pointer = pointer.next 
      end 
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n) because you could look through entire list before you found specified value
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?

      pointer = @head
      prev_node = nil 

      until pointer.nil?
        if pointer.data == value 
          if prev_node
            prev_node.next = pointer.next
          else
            @head = pointer.next
          end
          return
        else  
          prev_node = pointer 
          pointer = pointer.next
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: ?
    # Space Complexity: ?
    def reverse
      raise NotImplementedError
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

      return @head.value 
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def add_last(value)
      if @head.nil? 
        @head = Node.new(value)
        return
      end

      pointer = @head

      until pointer.next.nil? 
        pointer = pointer.next
      end
      pointer.next = Node.new(value)
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_last
      return nil if @head.nil?
      pointer = @head

      until pointer.next.nil?
        pointer = pointer.next 
      end

      return pointer.data
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
