require 'pry'
require_relative '../lib/card'
require_relative '../lib/guess'
require_relative '../lib/deck'
require 'minitest/autorun'
require 'minitest/pride'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end

  def test_it_has_cards
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
    assert_equal 3, @deck.count
  end
end
