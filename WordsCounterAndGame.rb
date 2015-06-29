#this program counts the words of user

puts "Please, insert a text below." #ask for text
text=gets.chomp  #read in

words= text.split(" ") #create array from text

frequencies= Hash.new(0) #Hash with default 0
wordcount = 0

words.each do |word| 
    word.downcase!
    frequencies[word]+=1 # count words
    wordcount+=1
end

frequencies=frequencies.sort_by do |word, count| #sort
    count
end

frequencies.reverse!

#print out
puts "Your used words:"  
frequencies.each do |w, f|
    puts w + " " + f.to_s
end

puts "which makes #{wordcount} words in total"

=begin
 small guessing game build on given words
 possible if more than one different word is used
=end 
if frequencies.length>1
    puts "Do you want to play with me? yes/no"
    answer=gets.chomp 
    answer.downcase!
    game=false
    done=false
    
    #check for answer 
    until done==true
        if answer=="yes"
            game=true
            done=true
        elsif answer=="no"
            puts"Maybe next time! Good Bye"
            done=true
        else 
            puts"yes or no?"
            answer=gets.chomp
            answer.downcase!    
        end
    end
        
    if game==true
        puts "Ok, I am thinking of one of your words, which one is it? For your memory the words: "  
        frequencies.each do |w, f|
            print w+" "
        end
        puts " "
        
        # a random choice of the word will be created here
        rnd = Random.new
        random=rnd.rand(words.length)
        my_word=words[random].downcase
        
        # until the player find the right answer compare words 
        found=false
        until found==true
            answer=gets.chomp
            answer.downcase! 
            if answer==my_word
                puts "Yes, you are right! I have to go now. Have a nice day :)"
                found=true
            else
                puts "Try again"
            end
        end
       
    end  
end