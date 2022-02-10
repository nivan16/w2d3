class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word #why is it Hangman and not self??
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    return false
  end

  def get_matching_indices(char)
    return [] if !(@secret_word.include?(char))

    indies = []
    @secret_word.each_char.with_index {|ele, idx| indies << idx if char == ele}
    return indies
  end

  def fill_indices(char, arr)
    arr.each {|index| @guess_word[index] = char}
  end

  #__________________________________Part 2_____________________________________#

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    end
    guessindies = self.get_matching_indices(char)

    if guessindies != []
      self.fill_indices(char, guessindies)
    else
      @remaining_incorrect_guesses -= 1 
    end  
    
    @attempted_chars << char
    return true
  end

  def ask_user_for_guess
    p "Enter a char: "
    return try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else 
      return false
    end
  end







end
