class CodeMaker
  attr_reader :secret_code

  def initialize
    @secret_code = generate_code
  end

  def reveal
    puts "The secret code was: #{@secret_code.join(', ')}"
  end

  private

  def generate_code
    COLORS.sample(CODE_LENGTH)
  end
end