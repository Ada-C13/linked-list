
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
    # Time Complexity: O(1) => because we don't need to traverse 
    # Space Complexity: O(1) => because we are not using any extra space
    def add_first(value)
      if @head.nil?
        @head = Node.new(value)
      else 
        @head = Node.new(value, @head)

        # # same as above
        # new_head = Node.new(value)
        # new_head.next = @head 
        # @head = new_head
      end 
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def search(value)
      return false if @head.nil?
      current = @head 

      until current.nil?
        return true if current.data == value
        current = current.next
      end 

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def find_max
      return nil if @head.nil?
      current = @head
      max = @head.data

      until current.nil?
        max = current.data if current.data > max

        current = current.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def find_min
      return nil if @head.nil?
      current = @head
      min = @head.data

      until current.nil?
        min = current.data if current.data < min
        current = current.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def length
      return 0 if @head.nil?

      count = 1
      current = @head 

      until current.next.nil?
        current = current.next
        count += 1
      end

      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def get_at_index(index) 

      return nil if @head.nil?
      current = @head 

      index.times do
        current = current.next 
        return nil if current.nil?
      end

      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def visit
      return nil if @head.nil?
      current = @head

      until current.nil?
        puts current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def delete(value) # 2, [2, 3, 4, 10, 9]
      return nil if @head.nil?
      current = @head
      prev = nil 

      until current.nil?
        if current.data == value 
          prev ? prev.next = current.next : @head = current.next
          return
        else  
          prev = current 
          current = current.next
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def reverse
      current = @head 
      prev_node = next_node = nil

      while current 
        next_node = current.next 
        current.next = prev_node 

        prev_node = current
        current = next_node 
      end 

      @head = prev_node
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def find_middle_value
      return nil if @head.nil?

      fast_runner = slow_runner = @head

      while !fast_runner.nil? && !fast_runner.next.nil?
        fast_runner = fast_runner.next.next
        slow_runner = slow_runner.next
      end

      return slow_runner.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    # sol1: Use 2 sticks
    def find_nth_from_end(n) 
      return nil if @head.nil?

      left_stick = right_stick = @head 

      n.times do 
        right_stick = right_stick.next
      end

      return nil if right_stick.nil?

      while !right_stick.nil? && !right_stick.next.nil?
        right_stick = right_stick.next 
        left_stick = left_stick.next
      end

      return left_stick.data
    end

    # or
    # # sol2: Use the length of the list
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    # def find_nth_from_end(n) 
    #   return  nil if @head.nil?
    #   current = @head 
    #   count = 0

    #   until current.nil?
    #     current = current.next
    #     count += 1
    #   end

    #   return nil if count <= n

    #   current = @head
    #   (count - n - 1).times do 
    #     current = current.next
    #   end

    #   return current.data
    # end



    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def has_cycle
      return false if @head.nil?

      fast_runner = slow_runner = @head
      
      while !fast_runner.nil? && !first_runner.next.nil?
        fast_runner = fast_runner.next.next
        slow_runner = slow_runner.next

        return true if fast_runner == slow_runner
      end

      return false
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1) => because we don't need to traverse 
    # Space Complexity: O(1) => because we are not using any extra space
    def get_first
      return nil if @head.nil?
      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def add_last(value)
      if @head.nil?
        @head = Node.new(value)
        return
      end

      current = @head

      until current.next.nil?
        current = current.next
      end

      current.next = Node.new(value)
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n) => where n is the length of the node
    # Space Complexity: O(1) => because we are not using any extra space
    def get_last
      return nil if @head.nil?
      current = @head

      until current.next.nil?
        current = current.next 
      end

      return current.data
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
