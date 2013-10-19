# print the contents of an array of sixteen numbers, fours numbers at a times using each and each_slice

# using each

values = []
[*(1..16)].each do |i|
  values.push(i)
  
  if (values.length == 4)
    puts values.join(",")
    values = []
  end
end

puts

# using each_slice

[*(1..16)].each_slice(4) do |i|
  puts i.join(",")
end

puts

# update the tree initialiser to accept a nested structure with hashes and arrays
class Tree
  attr_accessor :children, :node_name
  
  def initialize(tree)
    
    @node_name = tree.keys()[0]
    @children = []    

    tree[tree.keys()[0]].each do |k,v|
      @children.push(Tree.new({k=>v}))
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new({'grandpa'=>{'dad'=>{'child 1'=>{},'child 2'=>{}},'uncle'=>{'child 3'=>{},'child 4'=>{}}}})
tree.visit_all {|node| puts node.node_name }

puts

# Write a simple grep that prints lines of file having occurences of a phrase. In this case 'moon'

f = File.open("moon_wiki.txt")
f.each do |line|
  if (line.grep(/moon/i).length > 0) 
    puts "Match on line #{f.lineno} - #{line}"
  end
end

