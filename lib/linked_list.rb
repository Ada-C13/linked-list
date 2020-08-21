
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
    # Time Complexity: ?
    # Space Complexity: ?
    def add_first(value)
      @head = Node.new(value, @head)
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: ?
    # Space Complexity: ?
    def search(value)
      return false if !@head
      current = @head

      while current
        return true if current.data == value
        current = current.next
      end
      
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return if !@head
      current = @head
      max = @head.data

      while current
        max = current.data if current.data > max
        current = current.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: ?
    # Space Complexity: ?
    def find_min
      return if !@head
      current = @head
      max = @head.data
      
      while current
        max = current.data if current.data < max
        current = current.next
      end

      return max
    end

    # method that returns the length of the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def length
      return 0 if !@head
      current = @head
      count = 0

      while current
        count += 1
        current = current.next
      end

      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: ?
    # Space Complexity: ?
    def get_at_index(index)
      return if !@head
      current = @head
      count = 0
    
      until count == index
        return nil if !current
        current = current.next
        count += 1
      end

      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def visit
      return if !@head
      current = @head

      while current
        print current.data
        current = current.next
      end
      
      return nil
    end

    # method to delete the first node found with specified value
    # Time Complexity: ?
    # Space Complexity: ?
    def delete(value)
      return if !@head
      current = @head
      previous = nil

      while current
        if current.data == value
          @head = current.next if current == @head
          previous.next = current.next if previous # relink list if deleted value is in the middle
          current = nil
          return
        else 
          previous = current
          current = current.next     
        end
      end
      
      return nil
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: ?
    # Space Complexity: ?
    def reverse
      return if !@head
      current = @head
      previous = nil

      while current
        @head = current if !current.next
        temp = previous
        previous = current
        current = current.next
        previous.next = temp
      end

      return nil
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def find_middle_value
      return find_nth_from_end(length() / 2)
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: ?
    # Space Complexity: ?
    def find_nth_from_end(n)
      last_index = length() - 1
      return get_at_index(last_index - n)
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: ?
    # Space Complexity: ?
    def has_cycle
      return if !@head
      visited = Array.new(length())
      current = @head

      while current
        return true if visited.include?(current.next)
        visited.push(current)
        current = current.next
      end

      return false
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_first
      return @head ? @head.data : nil
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def add_last(value)
      return add_first(value) if !@head
    
      current = @head
      current = current.next until !current.next
      current.next = Node.new(value)
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_last
      return if !@head
      current = @head
      current = current.next until !current.next
      return current.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    def insert_ascending(value)
      return if !@head
      current = @head
      previous = nil

      while current
        if current.data > value
          new_node = Node.new(value, current)
        elsif !current.next # if we reach the end but haven't found a larger value
          new_node = Node.new(value)
        end

        previous ? previous.next = new_node : @head = new_node # if previous is nil, the new_node must become the head
        previous = current
        current = current.next
      end
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