require_relative 'util/io'

class Game 
    def create_players
        print "player 1: "
        name1 = Player.request_name
        print "player 2: "
        name2 = Player.request_name
        @player1 = Player.new(name1)
        @player2 = Player.new(name2)
        @current_player = @player1
    end
    def initialize
        # Warning: This will use ~50 megabytes of RAM.
        @dictionary = loadDictionaryFromURL('https://assets.aaonline.io/fullstack/ruby/projects/ghost/dictionary.txt')
        @pointer = @dictionary
        create_players
    end
    def switch_player!
        @current_player = @current_player == @player1 ? @player2 : @player1
    end
end