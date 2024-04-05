**by:** Paden Little, Ethan Morin, Cambry Partridge, Ryan Ratajczak

## Documentation

#### The Problem

A pseudo-code algorithm to sort an array of playing cards in a predefined order. 
Given an array of card objects, sorts the array in the following order:
- **Suits:** spades, hearts, clubs, diamonds
- **Values:** Ace, 1 - 10, Jack, Queen, King

#### Algorithm Steps

We first iterate through each card in the array starting at index 1. 

#### Initial Complexity estimation

As the underlying sort taking place is just an insertion sort with two constant complexities for the identification of each card, we estimate that the complexity will be $O(n^2)$

#### Data structure of a card

```java
enum Value {
	ACE, ONE, TWO, THREE, FOUR, FIVE, SIX, 
	SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING
}

enum Suit {
	SPADE, HEART, DIAMOND, CLUB
}

class Card {
	Value value
	Suit suit
  
	int CompareTo(Card card) {
		int cardSuit = this.suit.valueOf()
		int cardValue = this.value.valueOf().ordinal()
		int cardTotalValue = cardSuit + cardValue
	}
}
```

## Pseudocode

```
IF array is null OR array is empty, THROW a NullReferenceException

FOR each element in the array starting at the first index
	STORE the current value in temp variable
	FOR each element starting at current index, in reverse
		STORE current inner for loop position
		IF the temp variable is > inner for loop
			INSERT temp variable at Current inner for loop position + 1
			BREAK
```

## Unit Tests

#### Sorts a deck that has duplicate cards

**Method Name:** cardSortSortsArrayThatContainsDuplicateCards()

**Given Input:** 
\[Ace of Spades, One of Hearts, Ace of Spades, King of Clubs, Three of Hearts]
**Expected Output:** 
\[Ace of Spades, Ace of Spades, One of Hearts, Three of Hearts, King of Clubs]

**Justification:** This test is important as it ensures the sort does not fail if the given array contains duplicate cards.

#### Sorts a deck that has duplicate cards

**Method Name:** cardSortSortsArrayThatContainsDuplicateCards()

**Given Input:** 
\[Ace of Spades, One of Hearts, Ace of Spades, King of Clubs, Three of Hearts]
**Expected Output:** 
\[Ace of Spades, Ace of Spades, One of Hearts, Three of Hearts, King of Clubs]

**Justification:** This test is important as it ensures the sort does not fail if the given array contains duplicate cards.

## Big O Complexity
