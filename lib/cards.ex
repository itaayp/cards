defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
  Creates a deck of cards

  ## Examples
  
      iex> deck = Cards.create_deck
      iex> deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", ...]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Suffle the `deck` and returns it to the user.
  The `deck` argument is an array created by `Cards.create_deck`

  ## Examples
  
      iex> deck = Cards.create_deck
      iex> deck
      [1, 2, 3]
      iex> deck = Cards.shuffle(deck)
      iex> deck
      [2, 3, 1]

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Check if the `deck` contains the `card`. 
  The `deck` argument is an array created by `Cards.create_deck`.
  The `card` argument is a string.
  The return of this function is `true` or `false`.

  ## Examples
  
      iex> deck = Cards.create_deck
      iex> deck
      [Ace of Spades, Ace of Gold]
      iex> Cards.contains?(deck, "Ace of Gold")
      true
      iex> Cards.contains?(deck, "potato")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `deck` argument is an array created by `Cards.create_deck`.
  The `hand_size` argument indicates how many cards should be in the hand.
  The return of the function is a tuple containing on the firts index the hand, and on the second the remainder of the deck

  ## Examples
  
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save the `deck` into a file in the project folder. 
  The `deck` argument is an array created by `Cards.create_deck`.
  The `filename` argument is a string containing the disired file name.
  The return of this function is the status of saving the file.

  ## Examples
  
      iex> deck = Cards.create_deck
      iex> deck
      [Ace of Spades, Ace of Gold]
      iex> Cards.save(deck, "my_deck")
      :ok

  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads, from the system, the file cointaining the saved deck 
  The `filename` argument is a string coitaining the file name.
  The return of the function is an array containing the saved deck.

  ## Examples
  
      iex> Cards.load("my_deck")
      [Ace of Spades, Ace of Gold]
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary) 
      {:error, _reason} -> "This file does not exists"
    end
  end

  @doc """
  Creates a deck, shuffle it and then divides a deck into a hand and the remainder of the deck. 
  The `hand_size` argument indicates how many cards should be in the hand.
  The return of the function is a tuple containing on the firts index the hand, and on the second the remainder of the deck

  ## Examples
  
      iex> deck = Cards.create_hand(1)
      iex> deck
      ["Ten of Spades"]

  """
  def create_hand(hand_size) do
    Cards.create_deck
    |>Cards.shuffle
    |>Cards.deal(hand_size)
  end
end
