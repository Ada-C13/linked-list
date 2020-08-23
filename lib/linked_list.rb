
# Defines a node in the singly linked list
class Node
  attr_reader :data
  attr_accessor :next
  

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
      if @head.nil? 
        @head = Node.new(value)
      else 
        new_head = Node.new(value, @head)
        new_head.next = @head
        @head = new_head
      end 
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      if @head == nil 
        return false
      end 
      current = @head
      while current != nil 
          if current.data == value 
            return true
          end 
        current = current.next
      end 
      return false 
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      if @head.nil? 
        return nil
      end 

      current = @head
      max = @head.data

      while !current.nil?
         if current.data > max
           max = current.data 
         end 
       current = current.next
      end 

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      if @head.nil? 
        return nil
      end 

      current = @head
      min = @head.data

      while !current.nil? 
        if current.data < min
          min = current.data 
        end 
       current = current.next
      end 

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      current = @head
      count = 0
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
      if @head.nil? 
        return nil
      end 

      current = @head 
      current_index = 0
      while current != nil 
          if current_index == index 
            return current.data
          end 
        current_index += 1 
        current = current.next
      end
      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      if @head.nil?
        return nil
      end 

      current = @head 
      while current != nil 
        current = current.next
      end    
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
   
    def delete(value)
      if @head == nil 
        return 
      end 
      prev = nil
      current = @head 
      while current != nil 
        if current.data == value
          if prev == nil 
            @head = current.next 
          else
            prev.next = current.next 
          end  
        end
        prev = current 
        current = current.next
      end 
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      if @head.nil? 
        return nil
      end 
      
      prev = nil 
      next_node = nil
      current = @head

      while current != nil 
        next_node = current.next
        current.next = prev 
        prev = current 
        current = next_node 
      end

      @head = prev
      
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def find_middle_value
      n = length()
      if n == 0 
        return nil 
      end 
      i = 0
      current = @head 
      while i < (n/2)
        current = current.next
      end 
      return current 
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
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      if @head.nil? 
        return nil 
      end

      return @head.data 
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      if @head == nil 
        @head = Node.new(value) 
      else 

        current = @head
      
        while current.next != nil
          current = current.next
        end
        current.next = Node.new(value)
      end 
    end 

    

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      if @head == nil 
        return nil 
      end
  
      current = nil 
      next_node = @head
      while !next_node.nil?
        current = next_node
        next_node = next_node.next 
      end 
      return current.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    def insert_ascending(value)
      
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


