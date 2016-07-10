require 'pry'
require_relative '../lib/card'
require 'minitest/autorun'
require 'minitest/pride'

class CardTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
  end

  def test_it_has_a_question
    assert_equal "What is the capital of Alaska?", @card.question
  end

  def test_it_has_an_answer
    assert_equal "Juneau", @card.answer
  end

end
