
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  attr_accessor :prev # allow external entities to read or write next node


  def initialize(value, next_node = nil, prev_node = nil)
    @data = value
    @next = next_node
    @prev = prev_node
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
        current = @head
        first = Node.new(value)
        first.next = current
        current.prev = first
        @head = first
      end 
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(N)
    # Space Complexity: O(1)
    def search(value)
      current = @head
      if @head.nil?
        return false
      else 
        while current.next != nil
          if current.data == value
            return true
          else 
            current = current.next
          end
        end
      end
      if current.data == value
        return true
      else 
        return false
      end 
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(N)
    # Space Complexity: O(1)
    def find_max
      max = -1000000 
      current = @head
      if @head.nil?
        return nil
      elsif @head.next.nil?
        return @head.data
      else 
        while current.next != nil
          if current.data > max
            max = current.data
          end
          current = current.next
        end
      end

      if current.data > max
        max = current.data
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(N)
    # Space Complexity: O(1)
    def find_min
      min = 1000000
      current = @head 
      if @head.nil?
        return nil
      elsif @head.next.nil?
        return @head.data
      else 
        while current.next != nil
          if current.data < min
            min = current.data
          end
          current = current.next
        end 
      end 

      if current.data < min
        min = current.data
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(N)
    # Space Complexity: O(1)
    def length
      length = 1
      current = @head
      if current.nil?
        return 0
      elsif current.next.nil?
        return 1
      else 
        while current.next != nil
          length +=1
          current = current.next
        end
      end
      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(N)
    # Space Complexity: O(1)
    def get_at_index(index)
      count = 0 
      if index > self.length-1
        return nil
      end 

      current = @head
      if index == 0 
        return @head.data
      else
        while current.next != nil
          current = current.next
          count += 1
          if count == index
            return current.data
          end
        end
      end
      if index == self.length-1
        return current.data
      end
    end

    # method to print all the values in the linked list
    # Time Complexity: O(N)
    # Space Complexity: O(1)
    def visit
      current = @head
      while current.next != nil
        puts current.value
        current = current.next
      end 
      puts current.value
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(N)
    # Space Complexity: O(1)
    def delete(value)
      if @head.nil? 
        return nil
      end 
      current = @head 
      while current != nil
        if @head.next.nil? && @head.data == value
          @head = nil 
        elsif @head.next != nil && @head.data == value
          @head = @head.next
        elsif current.next != nil && current.prev != nil && current.data == value
            prevn = current.prev
            nextn = current.next
            prevn.next = nextn
            nextn.prev = prevn
        elsif  !current.prev.nil? && current.data == value
          current.prev.next = current.next 
        end 
        current = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(N)
    # Space Complexity: O(1)
    def reverse
      if @head.nil? || @head.next.nil? 
        return @head
      end
      
      current = @head

      while current.next != nil
        current = current.next
      end 

      # current = current.next
      @head = current

      while current != nil
        prev = current.prev
        current.prev = current.next
        current.next = prev
        current = prev
      end

      # if temp != nil
      #   @head = temp.prev
      # end 
    return @head
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
      raise NotImplementedError
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
