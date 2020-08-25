
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
    # Time Complexity: 0(1)
    # Space Complexity: 0(1)
    def add_first(value)
      @head = Node.new(value, @head)
      return @head
    end
    
    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: 
    # Space Complexity: ?
    def search(value)
      return false if @head.nil?
      
      current = @head
      while (current.next != nil && current.data != value) do
        current = current.next
        if current.data != value
          return false
        end
      end
      return true
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?
      current = @head 

      max = current.data
      while (current.next != nil)
        current = current.next
        if current.data > max
          max = current.data
        end
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: ?
    # Space Complexity: ?
    def find_min
     return nil if @head.nil?
     

      current = @head
      min = current.data
      while (current.next != nil)
        current = current.next
        if current.data < min
          min = current.data
        end 
      end
      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def length
      current_node = @head
      length = 0
      return 0 if @head.nil?
      
      while (!current_node.nil?)
        current_node = current_node.next
        length += 1
      end
      
      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: ?
    # Space Complexity: ?
    def get_at_index(index)
      return nil if @head.nil?
      current = @head
      index.times do 
        return nil if current.next.nil?
        current = current.next
      end
      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def visit
      current = @head
      if current = current.data
        return current.data
      end
    end
     

    # method to delete the first node found with specified value
    # Time Complexity: ?
    # Space Complexity: ?
    def delete(value)
      # if head is nil - return
      if @head.nil?
        return
      end
      # delete head if needed
      if @head.data == value
        @head = @head.next
        return
      end

      current_node = @head
      while (current_node.next != nil )
        if current_node.next.data == value
          current_node.next = current_node.next.next
          return
        end
        current_node = current_node.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: ?
    # Space Complexity: ?
    def reverse
      return if @head.nil?
      current = @head
      previous_node = nil
      while (!current.nil?)
        temp = current.next
        current.next = previous_node
        previous_node = current
        current = temp 
      end
      @head = previous_node
    end
  end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    # def find_middle_value
    # end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: ?
    # Space Complexity: ?
    # def find_nth_from_end(n)
    # end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: ?
    # Space Complexity: ?
    # def has_cycle
    # end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    # def get_first
      
    # end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    # def add_last(value)
      
    # end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    # def get_last
      
    # end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    # def insert_ascending(value)
      
    # end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    # def create_cycle
    #   return if @head == nil # don't do anything if the linked list is empty

      # navigate to last node
#       current = @head
#       while current.next != nil
#           current = current.next
#       end

#       current.next = @head # make the last node link to first node
#     end
# end
