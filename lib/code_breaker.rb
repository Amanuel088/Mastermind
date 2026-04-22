class CodeBreaker
  def initialize
    @remaining = COLORS.permutation(CODE_LENGTH).to_a
  end

  def get_guess
    loop do
      print "Your guess: "
      input = gets.chomp.downcase.split

      if input.length == CODE_LENGTH && input.all? { |c| COLORS.include?(c) }
        return input
      else
        puts "Invalid! Enter exactly #{CODE_LENGTH} colors from: #{COLORS.join(', ')}"
      end
    end
  end

  def computer_guess
    @remaining.first
  end

  def eliminate(guess, result)
    @remaining.reject! do |candidate|
      feedback = Feedback.new(candidate, guess)
      feedback.calculate != result
    end
    @remaining.shift
  end
end