require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do
    #arrange
    hand = ['Jack', 'King']

    #act
    score = blackjack_score(hand)

    #assert
    expect(score).must_equal 20

  end

  it 'calculates aces as 11 where it does not go over 21' do
    #arrange
    hand = ['Ace', 'Jack']

    # act
    score = blackjack_score(hand)

    # assert
    expect(score).must_equal 21

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do


    hand = ['Ace', 'Queen', 'King']

    # act
    score = blackjack_score(hand)

    # assert
    expect(score).must_equal 21

  end

  it 'raises an ArgumentError for invalid cards' do

    expect{
      blackjack_score(['dog', 11])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do

    expect{
      blackjack_score([7, 8, 'King'])
    }.must_raise ArgumentError

  end

  it 'raises an error if invalid # of cards' do

    expect{
      blackjack_score(['Ace', 3, 2, 2, 'Ace', 2])
    }.must_raise ArgumentError

    expect{
      blackjack_score(['Ace'])
    }.must_raise ArgumentError

  end


end
