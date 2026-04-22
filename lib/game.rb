require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'feedback'

class Game
  def initialize
    @code_maker   = CodeMaker.new
    @code_breaker = CodeBreaker.new
    @turns_taken  = 0
  end

  def play
    puts "\nWelcome to Mastermind!"
    puts "Guess the secret code! You have #{MAX_TURNS} turns."
    puts "Available colors: #{COLORS.join(', ')}"
    puts "Enter 4 colors separated by spaces (e.g: red blue green yellow)\n\n"

    MAX_TURNS.times do |turn|
      @turns_taken = turn + 1
      puts "Turn #{@turns_taken}/#{MAX_TURNS}"

      guess    = @code_breaker.get_guess
      feedback = Feedback.new(@code_maker.secret_code, guess)
      result   = feedback.calculate

      feedback.display(result)

      if result[:exact] == CODE_LENGTH
        puts "\nYou cracked the code in #{@turns_taken} turns! You win!"
        return
      end
    end

    @code_maker.reveal
    puts "Out of turns! Better luck next time."
  end
end