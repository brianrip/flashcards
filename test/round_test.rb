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

  def test_current_card_changes_with_each_guess
    assert_equal "Juneau", @round.current_card.answer
    recorded_guess = @round.record_guess("Juneau")
    assert_equal "93,000,000", @round.current_card.answer
  end

  def test_it_doesnt_count_an_incorrect_answer
    @round.record_guess("Fairbanks")
    assert_equal 0, @round.number_correct
    @round.record_guess("93,000,000")
    assert_equal 1, @round.number_correct
    assert_equal 2, @round.guesses.count
    assert_equal "incorrect.", @round.guesses.first.feedback
    assert_equal "correct.", @round.guesses.last.feedback
  end

  def test_it_calculates_percent_correct
    @round.record_guess("Fairbanks")
    @round.record_guess("93,000,000")
    assert_equal "50% Correct", @round.percent_correct
  end

end
