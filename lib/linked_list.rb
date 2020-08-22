
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
        @head = Node.new(value, next_node = @head)
      end
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: ?
    # Space Complexity: ?
    def search(value)
      node = @head
      return false if @head == nil || !node.next
      # return false if 
      return true if node.data == value
      while (node = node.next)
        return true if node.data == value
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head == nil

      max_value = @head.data
      pointer = @head

      while pointer
        if pointer.data > max_value
          max_value = pointer.data 
        end

        pointer = pointer.next
      end
  
      return max_value
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: ?
    def find_min
      return nil if @head == nil

      min_value = @head.data
      pointer = @head

      while pointer
        if pointer.data < min_value
          min_value = pointer.data 
        end
        
        pointer = pointer.next
      end
  
      return min_value

    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: ?
    def length
      return 0 if @head == nil
      return 1 if @head.next == nil

      pointer = @head 
      count = 1
      until pointer == @tail
          count += 1
          pointer = pointer.next
      end 

      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: ?
    # Space Complexity: ?
    def get_at_index(index)
      return nil if @head == nil
      return @head.data if index == 0

      pointer = @head 
      count = 0

      until count == index
          count += 1
          pointer = pointer.next
      end 

      return pointer.data  
    end

    # method to print all the values in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def visit
      return nil if @head == nil
      print @head.data if @head.next == nil

      pointer = @head 

      while pointer
          print pointer.data
          pointer = pointer.next
      end 
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: ?
    def delete(value)
      return if !@head
      @head = @head.next if @head.data == value
      pointer = @head
      previous = nil

      #go through each node
      while pointer
      #if the node equals the value the previous node.next should pointer to current node.next and the next node.previous needs to equal the previous node
        if pointer.data == value
          previous.next = pointer.next if previous
          pointer = nil
          return
        else
          previous = pointer 
          pointer = pointer.next   
        end
      end
      return
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: ?
    # Space Complexity: ?
    def reverse
      return nil if @head.nil?
      return @head if @head.next.nil?
      pointer = @head
      previous = nil
      #move each node.next to previous
      while pointer
        temp = previous
        previous = pointer
        pointer = pointer.next
        previous.next = temp
      end
      # Reset the head to the new start
      @head = previous
    end

    ## ---

    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def find_middle_value
      return nil if @head == nil
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: ?
    # Space Complexity: ?
    def find_nth_from_end(n)
      return nil if @head == nil
      return @head.data if n == 1 && @head.next == nil
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: ?
    # Space Complexity: ?
    def has_cycle
      return nil if @head == nil
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
      return nil if @head == nil
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_last
      return nil if @head == nil
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    def insert_ascending(value)
      return nil if @head == nil
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
