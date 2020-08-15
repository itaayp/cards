defmodule CardsTest do
  use ExUnit.Case
  doctest Cards
  
    test "create_deck returns a list of cards" do
        deck = Cards.create_deck
        assert deck = ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
                    "Five of Spades", "Six of Spades", "Seven of Spades", "Eight of Spades",
                    "Nine of Spades", "Ten of Spades", "Jack of Spades", "Queen of Spades",
                    "King of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
                    "Four of Clubs", "Five of Clubs", "Six of Clubs", "Seven of Clubs",
                    "Eight of Clubs", "Nine of Clubs", "Ten of Clubs", "Jack of Clubs",
                    "Queen of Clubs", "King of Clubs", "Ace of Hearts", "Two of Hearts",
                    "Three of Hearts", "Four of Hearts", "Five of Hearts", "Six of Hearts",
                    "Seven of Hearts", "Eight of Hearts", "Nine of Hearts", "Ten of Hearts",
                    "Jack of Hearts", "Queen of Hearts", "King of Hearts", "Ace of Diamonds",
                    "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds",
                    "Six of Diamonds", "Seven of Diamonds", "Eight of Diamonds",
                    "Nine of Diamonds", "Ten of Diamonds", "Jack of Diamonds", "Queen of Diamonds", 
                    "King of Diamonds"]
    end

    test "contains? function should return false when the card does not exists in the deck" do
        deck = Cards.create_deck

        refute Cards.contains?(deck, "potato")
    end

    test "contains? function should return true when the card exists in the deck" do
        deck = Cards.create_deck

        assert Cards.contains?(deck, "Ace of Diamonds")
    end

    test "deal(deck, hand_size) should split the deck in two" do
        deck = Cards.create_deck
        assert 52 == length(deck)

        {hand, second_hand} = Cards.deal(deck, 12)

        assert 12 == length(hand)
        assert 40 == length(second_hand)
    end
end
