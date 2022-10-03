def random_word()
    word = ""
    while word.length < 6 || word.length > 12
        word = File.readlines("common_words.txt").sample
    end
    word
end

def word_array(word)
    word_arr = word.split('')
    word_arr.pop()
    word_arr
end


secret_word = random_word()
word_arr = word_array(secret_word)
correct_letters_array = Array.new(secret_word.length, '_')

puts "#{correct_letters_array.join()}\n\n
Welcome to Hangman! The computer has randomly selected a word for you (between 5 and 12 letters). Guess a letter. You have X guesses."
guess = gets.chomp.downcase
i = 0
word_arr.each_with_index do | letter, index |
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
end

puts correct_letters_array.join()

