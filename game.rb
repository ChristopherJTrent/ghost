require_relative 'util/io'

class Game 
    def initialize
        # Warning: This will use ~50 megabytes of RAM.
        @dictionary = loadDictionaryFromURL('https://assets.aaonline.io/fullstack/ruby/projects/ghost/dictionary.txt')

    end
end