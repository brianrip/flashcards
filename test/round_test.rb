require 'pry'
require_relative '../lib/guess'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/round'
require 'minitest/autorun'
require 'minitest/pride'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_a_round_has_decks_of_cards
    assert_equal @deck, @round.deck
  end

  def test_it_has_guesses
    assert_equal [], @round.guesses
  end

  def test_it_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_a_round_can_record_a_guess
    recorded_guess = @round.record_guess("Juneau")
    assert_equal @round.guesses[0], recorded_guess
    assert_equal 1, @round.guesses.count
    assert_equal 'correct.', @round.guesses.first.feedback
    assert_equal 1, @round.number_correct
  end

end


# round.number_correct
# => 1
# round.current_card
# => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">
# round.record_guess("2")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
# round.guesses.count
# => 2
# round.guesses.last.feedback
# => "Incorrect."
# round.number_correct
# => 1
# round.percent_correct
# => 50
