class OrangeTree

    def initialize      
        @height = 0.5       # in meters 
        @count = 0          # makes fruit @ 6 Y/O
        @age = 1            # oranges fall off @ end
                            # of the season

        puts "You have planted an orange tree sapling! How exciting!"
        puts "Soon you will have fresh fruit grown from your"
        puts "very own backyard!"
    end    

    def count_the_oranges
        if @age >= 6 && @count > 0
            puts "There are #{@count} oranges on the tree."
            puts "Better take some before they go bad!"
        elsif @age >= 6 && @count == 0
            puts "There are #{@count} oranges on the tree."
        else   
            puts "There are #{@count} oranges on the tree."
        end
    end
    
    def pick_an_orange
        if @age >= 6 && @count > 0
            @count -= 1
            puts "You pick an orange."
            puts "There's #{@count} left to pick..."
        else
            puts "There's nothin' to pick!" 
        end
    end

    def makes_oranges?
        @age >= 6
    end
    
    def pass_time
        if @age >= 90
            puts "The orange tree, standing tall and mighty,"
            puts "will likely outlive you. As you enter old age you"
            puts "wonder what might become of this tree that you've grown"
            puts "together with. Although you may soon be leaving this"
            puts "world, you take solace in knowing that you've added"
            puts "something to the world. Something for those"
            puts "who have yet to come to enjoy."
            exit
        else 
            if makes_oranges?
                @count = @age * 2
            else 
                @count = 0
            end    
                
            @age += 1
            @height += 0.5
            puts "Another year passes..."
            if @height <= 1
                puts "The mighty orange tree now stands at #{@height} meter tall!"
                puts "Not very mighty..."
            else
                puts "The mighty orange tree now stands #{@height} meters tall!"
                puts "I think it's #{@age} years old now..."
            end    
        end
    end
    
    def pass_many years
        years.times do
            if makes_oranges?
                @count = @age * 2
            else 
                @count = 0
            end    
                
            @age += 1
            @height += 0.5
        end
        puts "The mighty orange tree now stands #{@height} meters tall!"
        puts "I think it's #{@age} years old now..."
    end

    def alive
        @age < 91
    end    
end

def run
    tree = OrangeTree.new
    
    commands = [
        "Commands:", 
        "1. Count the oranges",
        "2. Pick an orange",
        "3. Wait a year and see what grows...",
        "4. Pass ten years",
        "",
        "Select a number to make your choice."
    ]

    commands.each do |i|
        puts "#{i}"
    end

    while tree.alive
        puts "What would you like to do?"


        reply = gets.chomp

        good_reply = false
        while not good_reply
            case reply
            when 'commands'
                commands.each do |i|
                    puts "#{i}"
                end
                good_reply = true
            when '1'
                good_reply = true
                tree.count_the_oranges
            when '2'
                good_reply = true
                tree.pick_an_orange
            when '3'
                good_reply = true
                tree.pass_time
            when '4'
                good_reply = true
                tree.pass_many(10)
            else
                puts "Please select the number that corresponds with what you would like to do."
                puts "Type 'commands' to see the choices again."
                reply = gets.chomp    
            end
        end
    end
end

run