class Player
    def self.request_name
        puts "please input your name"
        gets.chomp
    end
    def initialize(name)
        @name = name
        @losses = 0
    end
    def get_move
        puts "please input a letter."
        gets.chomp.downcase
    end
    def lose
        @losses += 1
    end
end