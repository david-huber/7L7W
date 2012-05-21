class Tree
  attr_accessor :children, :node_name

  def initialize(nodes={}) 
    @node_name, childNodes = nodes.take(1)[0]
    @children = childNodes.map { |k, v| Tree.new({k => v}) }
  end

  def visit_all(&block) 
    visit &block
    @children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'grandpa' => {'dad' => {'1' => {}, '2' => {}}, 'uncle' => {'3' => {}, '4' => {}}}})

ruby_tree.visit_all {|node| puts "Hello #{node.node_name}"}

