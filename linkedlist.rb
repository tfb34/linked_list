require './node'


class LinkedList
  def initialize
  	@size=0
  	@root=nil;
  	@tail=nil;
  end
  #adds a new node to the end of the list
  def append(node)
     if @root==nil
     	@root=node
     	@tail=node
     else
     	@tail.next_node = node
     	@tail= node

     end
     @size+=1
  end
  
  #adds a new node to the start of the list
  def prepend(node)
  	  if @root==nil
         @root=node
         @tail=node
      else
         node.next_node=@root
         @root=node
       end
      @size+=1
  end

  #returns the total number of nodes in the list
  def size
    return @size
  end

  #returns the first node in the list
  def head
    return @root
  end

  #returns the last node in the list
  def tail
     return @tail
  end

  #returns the node at the given index
  def at(x)
  	if x == 0
  		return @root
  	end
  	node=@root
     for i in 1..x
          node=node.next_node
      end
      return node
  end

  #removes the last element in the list
  def pop
     if @size==1
     	@root=nil
     	@tail=nil
     	@size-=1
     elsif @size>1
     	#want second to last element
        node=at(@size-2)
        node.next_node=nil
        @tail=node
        @size-=1
     end

  end

  #returns true if the passed in value is in list, otherwise false
  def contains? (value)
    return false if @size == 0
    if @root.value == value
  		return true
  	end
  	node=@root.next_node
     while(node!=nil)
        if node.value == value
        	return true
        end
        node=node.next_node
     end
      return false
  end

  #returns the index of the node containing data, or nil
  def find(data)
    return nil if @size ==0
    node = @root
    for i in 0...@size 
      if node.value == data
      	return i
      end
      node=node.next_node
    end
    return nil
  end

  #(data)->(data)->nil
  def to_s
  	return nil if @size == 0
  	node=@root
  	arr=[]
  	while (node!=nil)
      arr << node.value
      node=node.next_node
  	end
  	arr << "nil"
  	return arr.join(" -> ")
  end

  #inserts the data at the given index
  def insert_at(i,data)
    if i<0 || i>= @size
    	return nil
    end
    node=Node.new
    node.value=data
    if i==0
    	node.next_node=@root
    	@root=node
    else
       pre_node=at(i-1)
       node.next_node=pre_node.next_node
       pre_node.next_node=node
    end
    @size+=1
  end

  #removes the node at the given index
  def remove_at(i)
  	 if @size==0 || i<0 || i>=@size
  	 	return nil
  	 end
  	 if i==0 && @size==1
  	 	@root=nil
  	 	@tail=nil  
  	 elsif i==0
        @root=@root.next_node
     else
     	pre_node=at(i-1)
     	i_node= pre_node.next_node
     	pre_node.next_node=i_node.next_node
        if i==@size-1#if last element was removed, update tails
        @tail=pre_node
        end
     end
     @size-=1

  end

end


