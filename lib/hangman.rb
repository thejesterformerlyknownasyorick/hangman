require 'yaml'

class GameTools

    def initialize(word)
        @word = word
    end

    def word_array(word)
        @word_arr = @word.split('')
        @word_arr.pop()
        @word_arr
    end

    def correct_letters_array(word)
        @correct_letters_array = Array.new(word.length, '_')
        @correct_letters_array.pop()
        @correct_letters_array
    end

end


def random_word()
    word = ""
    while word.length < 6 || word.length > 12
        word = File.readlines("common_words.txt").sample
    end
    word
end

secret_word = random_word()
holder = secret_word.split('')
holder.pop()
secret_word = holder.join()

hangman = GameTools.new(secret_word)

puts "Welcome to Hangman! The computer has randomly selected a word for you (between 5 and 12 letters). Guess a letter. You have 6 guesses.\n\n
Would you like to reload an old save?"
load = gets.chomp.downcase
if load == 'yes'
    YAML.load(File.read('saves/yaml.dump'))
elsif load == 'no'
    word_array = hangman.word_array(secret_word)
    correct_letters_array = hangman.correct_letters_array(secret_word)
else puts "Sorry, please type 'yes' or 'no'"
end

tries = 0
win = false
puts secret_word
    

    while tries < 6
        puts "\n\n#{correct_letters_array.join()}\n\n
        You have #{7 - tries - 1} guesses left! Which letter would you like to guess?
        You can also type 'save' to save your game and come back later!"
        guess = gets.chomp.downcase
        i = 0
        word_array.each_with_index do | letter, index |
            index < secret_word.length
            if letter == guess
                correct_letters_array[index] = guess
                i += 1
            else
                i += 0
            end
        end
        if i == 0
            puts "Sorry, that letter isn't in this word."
            tries += 1
        elsif correct_letters_array.join() == word_array.join
            tries = 7
            win = true
        end
    end
    if win == true
        puts "You got it! The word was #{secret_word}."
    else
        puts "Better luck next time, champ. The word was #{secret_word}."
    end