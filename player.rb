class Player
    attr_reader :name
    attr_reader :letter
    
    def initialize(name, letter)
        @name = name
        @letter = letter
    end

    def print_player
        puts "Name: #{@name} Letter: #{@letter}"
    end
end