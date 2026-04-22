class Feedback
  def initialize(secret_code, guess)
    @secret_code = secret_code
    @guess = guess
  end

  def calculate
    { exact: exact_matches, color: color_matches }
  end

  def display(feedback)
    exact_marks = "✓" * feedback[:exact]
    color_marks = "o" * feedback[:color]
    empty_marks = "-" * (CODE_LENGTH - feedback[:exact] - feedback[:color])
    puts "Feedback: #{exact_marks}#{color_marks}#{empty_marks}"
    puts "  (✓ = right color & position | o = right color, wrong position)\n\n"
  end

  private

  def exact_matches
    @guess.each_with_index.count { |color, i| color == @secret_code[i] }
  end

  def color_matches
    secret_remaining = []
    guess_remaining = []

    @guess.each_with_index do |color, i|
      if color == @secret_code[i]
        next
      else
        secret_remaining << @secret_code[i]
        guess_remaining << color
      end
    end

    count = 0
    guess_remaining.each do |color|
      if secret_remaining.include?(color)
        count += 1
        secret_remaining.delete_at(secret_remaining.index(color))
      end
    end
    count
  end
end