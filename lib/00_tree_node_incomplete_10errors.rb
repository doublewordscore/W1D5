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
    if node == nil
      self.parent.children.delete_if { |child| self == child }
      @parent = nil
    else
      @parent = node
      self.parent.children.delete_if { |child| self == child }
      node.children << self
    end
  end

  def add_child(node)
    node.parent = self
  end

end
