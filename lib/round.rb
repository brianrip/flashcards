require_relative 'guess'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(response)
    guess = Guess.new(response, current_card)
    @guesses << guess
    @deck.cards.rotate!
    guess
  end

  def number_correct
    @guesses.select {|guess| guess.correct? }.count
  end

  def percent_correct
    percentage = ((number_correct.to_f/@guesses.count) * 100).round
    "#{percentage}% Correct"
  end

end
