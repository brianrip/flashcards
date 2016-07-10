require 'pry'
require_relative '../lib/guess'
require_relative '../lib/card'
require 'minitest/autorun'
require 'minitest/pride'

class GuessTest < Minitest::Test

  def setup
    card = Card.new("What is the capital of Alaksa?", "Juneau")
    @correct_guess = Guess.new("Juneau", card )
    @incorrect_guess = Guess.new("Balls", card )
  end

  def test_a_guess_has_a_response
    assert_equal "Juneau", @correct_guess.response
  end

  def test_a_guess_initializes_with_a_card
    assert_equal "What is the capital of Alaksa?", @correct_guess.card.question
    assert_equal "Juneau", @correct_guess.card.answer
  end

  def test_it_checks_for_a_correct_response
    refute @incorrect_guess.correct?
  end

  def test_a_guess_can_give_feedback
    assert_equal "correct.", @correct_guess.feedback
    assert_equal "incorrect.", @incorrect_guess.feedback
  end

end
