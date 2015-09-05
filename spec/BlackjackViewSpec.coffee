assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should end the game if the player busts', ->
      hand.minScore = 21
      expect(trigger).to.be('bust')