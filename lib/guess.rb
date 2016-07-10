require_relative 'card'

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    if response == ""
      @response = get_response
    else
      @response = response
    end
    @card = card
  end

  def get_response
    puts "Enter a guess"
    gets.chomp
  end

  def correct?
    response == card.answer
  end

  def feedback
    correct? ? "correct." : "incorrect."
  end
  
end
