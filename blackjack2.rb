$deck = Array.new #making an array called 'deck'. the '$'(money sign) is called a Universal/Global variable


def hand_value(hand) #calling upon function "hand_value". Getting hand (made up var. at the moment) 
  value = 0
  for card in hand #do is a method. calling upon each card in the hand
   if $deck_values.keys.include?(card) # IF the keys of deck_values are included in the card, then..
     value += $deck_values[card] #value is equal to the card within deck_values
   else #otherwise, if value is NOT equal to the keys of deck_values, then value is equal to card
    value += card  
   end
  end
  return value
end

def hit_hand(hand, deck) #using function "def" (which means "define") ->calls upon funct. "hit_hand"
  puts "hitting your hand.." #caliing from both hand and deck using putting it into hand
  hand.push(deck.pop) #pulling card from the deck and PUSH (putting) into the hand
end


def print_player_hand #using funct. "print_player_hand" 
  puts "Player has cards: " + $player.inspect
  puts "The value of Player's hand: " + hand_value($player).to_s
end

def print_dealer_hand #using funct. "print_dealer_hand" 
  puts "Dealer has cards: " + $dealer.inspect
  puts "The value of Dealer's hand: " + hand_value($dealer).to_s
end

$deck_values = {} #those two dented paranthesis means "hash" - for hash, you can use "Hash.new" or "{}"


$deck_values["A"] = 11
$deck_values["J"] = 10
$deck_values["K"] = 10  
$deck_values["Q"] = 10

$dealer = Array.new
$player = Array.new


number_cards = (2..10).to_a #making a new variable- "number_cards" which contains an array ("to_a" is a shortcut to saying make it into an array) of numbers 2-10
face_cards = ["A", "J", "K", "Q"]
all_cards = number_cards + face_cards

all_cards.each do |suit_card| #each of all the cards do a suit card. do is a method
  4.times { $deck.push(suit_card) } #it "pushes" (puts) suit card into the deck 4 times
end

$deck = $deck.sort_by { rand($deck.size) } #randomize and sort by the size of the deck

#here we are "hitting" (giving) the player 2 cards from the deck
2.times { hit_hand($player, $deck) } 

loop do
  system('clear') #clears the screen
  print_player_hand
  puts "What would player like to do? (hit or stand):"
  resp = gets.strip #gets user input

  if resp == "hit"
    hit_hand($player, $deck) #if the user responds with "hit", the dealer 'hits' (hands) a hand from the deck to the player from the deck
    print_player_hand #thus, print the player's current hand
    puts "------"
  end
end

                                                                                                                                   
