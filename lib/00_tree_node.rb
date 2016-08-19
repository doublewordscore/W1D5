class PolyTreeNode

  def initialize(value = "new_node")
    @value = value
    @parent = nil
    @children = []
  end


  def parent
    @parent
  end


  def children
    @children
  end


  def value
    @value
  end


  def parent=(node)

    old_parent = @parent

    old_parent.children.delete_if{ |child| self == child } unless old_parent == nil

    if node == nil
      @parent = nil
    else
      @parent = node
      @parent.children << self unless @parent.children.include?(self)
    end
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(child) #self is parent

    child.parent = nil

    raise "error" unless self.children.include?(child)

  end

  def dfs(target_value)
    return self if target_value == self.value
    self.children.each do |child|
      search = child.dfs(target_value)
      return search unless search.nil?
    end

    nil

  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      current = queue.shift
      return current if current.value == target_value
      queue.concat(current.children)
    end

  end


end
