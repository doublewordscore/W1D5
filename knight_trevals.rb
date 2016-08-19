require_relative "lib/00_tree_node.rb"
require "byebug"

class KnightPathFinder

  DELTAS = [ [1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1] ]

  attr_accessor :start_pos , :visited_positions ,  :move_tree

  def initialize(start_pos)
    @start_pos = start_pos
    @move_tree = PolyTreeNode.new(start_pos)
    @visited_positions = [start_pos]

  end

  def self.valid_moves(pos) # sample start_pos =
    possible_moves = []
    DELTAS.each do |move|
      current_x = move.first + pos.first
      current_y = move.last + pos.last
      possible_moves << [current_x, current_y]
    end
    possible_moves.reject do |move|
      move.first < 0 || move.first > 8 || move.last < 0 ||
      move.last > 8
    end
  end

  def build_move_tree

    all_nodes = [move_tree]
    all_nodes_arr = [move_tree.value]
    debugger
    until all_nodes.empty?
      current = all_nodes.shift
      arr_current = all_nodes_arr.shift
      children = current.new_move_positions(start_pos)
      children.each do |child|
        child_thing = child
        current_child = PolyTreeNode.new(child_thing)
        current.add_child(current_child)
        all_nodes << current_child
        all_nodes_arr << child_thing
      end
    end
    move_tree
  end

  def new_move_positions(pos)
    nonvisisted_moves = []
    KnightPathFinder.valid_moves(pos).each do |move|
      nonvisisted_moves << move unless visited_positions.include?(move)
      visited_positions << move
    end
    nonvisisted_moves
  end
  #
  # def find_path(end_pos)
  #   move_tree.dfs(end_pos)
  # end


end



a = KnightPathFinder.new([0,0])
b = a.build_move_tree

p b.children
