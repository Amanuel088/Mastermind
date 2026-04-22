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
    puts "\n🎯 Welcome to Mastermind!"
    role = choose_role

    if role == '1'
      human_guesses
    else
      human_makes_code
    end
  end

  private

  def choose_role
    loop do
      puts "\nChoose your role:"
      puts "1. Guesser   (computer creates the code, you guess)"
      puts "2. Code Maker (you create the code, computer guesses)"
      print "\nEnter 1 or 2: "
      input = gets.chomp.strip

      return input if %w[1 2].include?(input)

      puts "❌ Invalid choice! Please enter 1 or 2."
    end
  end

  def human_guesses
    puts "\n🤖 I've generated a secret code. Can you crack it?"
    puts "Available colors: #{COLORS.join(', ')}"
    puts "You have #{MAX_TURNS} turns. Good luck!\n\n"

    MAX_TURNS.times do |turn|
      @turns_taken = turn + 1
      puts "Turn #{@turns_taken}/#{MAX_TURNS}"

      guess    = @code_breaker.get_guess
      feedback = Feedback.new(@code_maker.secret_code, guess)
      result   = feedback.calculate

      feedback.display(result)

      if result[:exact] == CODE_LENGTH
        puts "\n🎉 You cracked the code in #{@turns_taken} turns! You win!"
        return
      end
    end

    @code_maker.reveal
    puts "💀 Out of turns! Better luck next time."
  end

  def human_makes_code
    secret = get_human_code
    puts "\n🤖 Challenge accepted! I will now try to guess your code...\n\n"

    MAX_TURNS.times do |turn|
      @turns_taken = turn + 1
      puts "Turn #{@turns_taken}/#{MAX_TURNS}"

      guess    = @code_breaker.computer_guess
      feedback = Feedback.new(secret, guess)
      result   = feedback.calculate

      puts "💻 Computer guesses: #{guess.join(', ')}"
      feedback.display(result)

      if result[:exact] == CODE_LENGTH
        puts "\n🤖 I cracked your code in #{@turns_taken} turns! Computer wins!"
        return
      end
    end

    puts "\n🎉 I couldn't guess your code #{secret.join(', ')}! You win!"
  end

  def get_human_code
    loop do
      puts "\nAvailable colors: #{COLORS.join(', ')}"
      print "Enter your secret code (4 colors separated by spaces): "
      input = gets.chomp.downcase.split

      if input.length == CODE_LENGTH && input.all? { |c| COLORS.include?(c) }
        puts "✅ Secret code set! Don't tell the computer! 🤫"
        return input
      else
        puts "❌ Invalid! Enter exactly #{CODE_LENGTH} colors from: #{COLORS.join(', ')}"
      end
    end
  end
end