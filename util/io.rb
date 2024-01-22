require_relative '../DataStructures/StringTreeNode'
require 'open-uri'
def loadDictionaryFromURL(url)
    tree = StringTreeNode.new
    URI.open(url) do |file|
        file.each_line{|line| tree.addWord!(line.chomp)}
    end
    tree
end