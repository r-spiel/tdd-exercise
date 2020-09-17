# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  if hand.length < 2 || hand.length > 5
    raise ArgumentError.new ("This hand is invalid (wrong number of cards)")
  end

  hand.each do |card|
    if !VALID_CARDS.any?(card)
      raise ArgumentError.new("#{card} is an invalid card")
    end
  end

  score = 0
  hand_copy = hand.dup

  hand_copy.each do |card|
    case card
    when 'Jack', 'Queen', 'King'
      card = 10
    when 'Ace'
      card = 1
    end
    score += card
  end

  count_of_aces = hand.count('Ace') #I decided to count the Aces and do it this way in case there was more than 1 ace, although in retrospect, I realize that you wouldn't ever add more than 1 extra "10" value... so I could've just done if hand.include?('Ace') && score <= 11 score += 10 end

  count_of_aces.times do
    if score <= 11
      score += 10
    end
  end

  if score > 21
    raise ArgumentError.new("BUSTED - You over 21 with #{score}")
  end

  return score
end
