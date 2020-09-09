
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
    attr_reader :head

    def initialize
      @head = nil # keep the head private. Not accessible outside this class
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def add_first(value)
      new_node = Node.new(value)
      if @head.nil?
        @head = new_node
      else
        new_node.next = @head
        @head = new_node
      end

    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      if @head.nil? && !value.nil?
        return false
      else
        current_node = @head
        until current_node.nil?
          return true if current_node.data == value
          current_node = current_node.next
        end
        return false
      end
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      if @head.nil?
        return nil
      else
        max = @head.data
        current_node = @head
        until current_node.next.nil?
          current_node = current_node.next
 
          if current_node.data > max
            max = current_node.data
          end
        end
        return max
      end
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      if @head.nil?
        return nil
      else
        min = @head.data
        current_node = @head
        until current_node.next.nil?
          current_node = current_node.next
          if current_node.data < min
            min = current_node.data
          end
        end
        return min
      end
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      if @head.nil?
        return 0
      else
        count = 1
        current_node = @head
        until current_node.next.nil?
          current_node = current_node.next
          count += 1
        end
        return count
      end    
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: ?
    # Space Complexity: ?
    def get_at_index(index)
      if @head.nil?
        return nil
      else
        count = 0
        indexed_value = @head
        until count == index || indexed_value.next.nil?
          count += 1
          indexed_value = indexed_value.next
        end
        if count != index
          return nil
        end
        return indexed_value.data
      end

    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      if @head.nil?
        return nil
      else
        puts(@head.data)
        current_node = @head
        until current_node.next.nil?
          current_node = current_node.next
          puts(current_node.data)
        end
        return 
      end    
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      if @head.nil? && !value.nil?
        return nil
      else
        previous_node = nil
        current_node = nil
        if @head.data == value
          @head = @head.next
          return
        else
          previous_node = @head
          current_node = @head.next
        end

        until current_node.nil?

          if current_node.data == value
            previous_node.next = current_node.next
            return
          end
          previous_node = previous_node.next
          current_node = current_node.next
        end
        return 
      end    
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def reverse
      if @head.nil?
        return nil
      else
        all_nodes = {}
        current_node = @head
        current_count = 0
        total_length = 1
        all_nodes[current_count] = current_node
        until current_node.next.nil?
          current_count += 1
          total_length += 1
          current_node = current_node.next
          all_nodes[current_count] = current_node
        end

        @head = all_nodes[total_length-1]
        current_node = @head
        (total_length-1).times do |x|
          new_index_to_add = total_length-(x+2)
          current_node.next = all_nodes[new_index_to_add]
          current_node = current_node.next
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
