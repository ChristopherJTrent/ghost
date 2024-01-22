require 'byebug'

class StringTreeNode
    attr_reader :value, :children
    # there are two reserved values, :root (which denotes the root element)
    # and :leaf, which tells my functions that a node is a leaf.
    def initialize(value = :root, children = {})
        @value = value
        @children = children
    end
    # I know this violates standard, but it's an extremely useful abstraction.
    # :final is the value we actually care about, current is a propogator
    # that the end-user shouldn't ever care about or pass.
    def addWord!(current=nil, final)
        # each call to addWord! will recursively work down through
        # the data structure to add each letter as a child node
        # to the current value, until we reach the end of the structure.
        # to do this, we will pass down a value of current, which is equal to
        # the remaining fragment of our word, and final, which will be the full word.
        # once the end of the word has been found, final will be set as the leaf node at the bottom.
        # This data structure will contain at most 26^n elements, where N is the length of the longest word.
        current = final if current == nil
        if current.length == 0
            children[:leaf] = final
            return
        end
        letter, remainder = current[0].to_sym, current[1..]
        children[letter] = StringTreeNode.new(letter) unless children.include?(letter) 
        children[letter].addWord!(remainder, final)
    end
    
    def print(padding = 0)
        puts (" "*padding) + value.to_s 
        return nil if children == nil
        children.each do |symbol, child|
            child.print(padding + 2) if child.respond_to?(:print)
            puts "#{" "*(padding+2)}Leaf: #{child}" unless child.respond_to?(:print)
        end
        return nil
    end

    def [](key)
        children[key]
    end

    # O(n) lookup where n is fragment.length
    def include?(fragment)
        current = children
        fragment.chars.each do |character|
            return false if current[character.to_sym] == nil
            current = current[character.to_sym]
        end
        !!current[:leaf]
    end
    def valid_move?(character)
        children[character] != nil
    end
end