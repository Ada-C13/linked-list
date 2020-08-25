
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  # attr_accessor :previous

  def initialize(value)
    @data = value
    @next = nil
    # @previous = previous
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
      # @tail = nil
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def add_first(value)
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n) because it could potentially go through the entire list.
    # Space Complexity: O(1) because nothing is getting added.
    def search(value)
      
      if @head.nil?
        return false
      else
        current = @head
        until current.nil?
          if current.data == value
            return true
          end
            current = current.next
        end
        return false
      end
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) because it goes through the entire list.
    # Space Complexity: O(1) because nothing is getting added.
    def find_max
      if !@head
        return nil
      end

      current = @head
      max = current.data

      until current == nil 
        if current.data > max 
          max = current.data
        end 
        current = current.next
      end
      return max
    end


    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) because it goes through the entire list.
    # Space Complexity: O(1) because nothing is getting added.
    def find_min
      if !@head
        return nil
      end

      current = @head
      min = current.data
     
      until current == nil 
        if current.data < min 
          min = current.data
        end 
        current = current.next
      end
      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n) because it goes through the entire list.
    # Space Complexity: O(1) because nothing is getting added.
    def length
      current = @head
      count = 0

      until current == nil
        count += 1
        current = current.next
      end

      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n) because it could potentially go through the entire list.
    # Space Complexity: O(1) because nothing is getting added.
    def get_at_index(index)
      current = @head
      count = 0

      if current == nil
        return nil
      end

      until count == index || current == nil
        count += 1
        current = current.next
      end

      return current.data
      
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n) because it goes through the entire list.
    # Space Complexity: O(1) because i dont think printing counts as adding???
    def visit
      current = @head

      if current == nil
        return nil
      end

      until current == nil
        print curent.data
        current = current.next
      end
      return
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n2) because there is a loop that goes through the entire list, then the possibility of it going through almost the entire list again.
    # Space Complexity: O(1)
    def delete(value)
      if @head.nil?
        return 
      else
        current = @head
        count = 0

        until current.nil?
          if current.data == value
            saveNext = current.next

            if count == 0
              @head = current.next
              current = nil
              return nil
            end
            current = nil
            
            newCurrent = @head

            (count-1).times do
              newCurrent = newCurrent.next
            end

            newCurrent.next = saveNext
            return nil
          end
          count += 1
          current = current.next
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n2) because it goes loops through almost the entire list then within that loop it loops again.
    # Space Complexity: ?
    def reverse
      listLength = length
      current = @head
      count = length - 1

      count.times do |i|
        innerCount = count - i

        (innerCount-1).times do 
          current = current.next
        end

        add_last(current.data)
        delete(current.data)
        current = @head
        innerCount -= 1
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
    # Time Complexity: O(n) this stems from the get_at_index part.
    # Space Complexity: O(1)
    def find_nth_from_end(n)

      listLength = length

      index = listLength - n - 1

      if index < 0
        return nil
      end

      return get_at_index(index)
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
    # Time Complexity: O(1) returning the first element is straight forward no looping needed.
    # Space Complexity: O(1)
    def get_first
      if @head == nil
        return nil
      end

      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: ?O(n) due to the loop to get to the end
    # Space Complexity: O(1)
    def add_last(value)

      new_node = Node.new(value)
      current = @head

      if current == nil
        add_first(value)
        return
      end

      until current.next == nil 
        current = current.next
      end
      
      current.next = new_node
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?O(n) due to the loop to get to the end
    # Space Complexity: O(1)
    def get_last
      current = @head

      if current == nil
        returen nil
      end

      until current.next == nil 
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
