class CodeBreaker
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
end