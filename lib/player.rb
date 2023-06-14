class Player
    attr_accessor :name
    attr_accessor :letter

    def initialize(name, letter)
        @name = name
        @letter = letter
    end

    def print_player
        puts "Name: #{@name} Letter: #{@letter}"
    end
end