# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
#Logic needs to be here
  #put game rules in here
  

# events:
    # playerHand = @get 'playerHand'
    # playerHand.on('bust' => this@trigger 'playerBust')

    @get('playerHand').on 'bust', =>
      @trigger 'playerBust'

    @get('dealerHand').on 'bust', =>
      @trigger 'dealerBust'

    @get('playerHand').on 'stand', =>
      @get('dealerHand').dealerStart()


# get playerHand
  # listen for 'stand'
  # once we hear stand get dealerhand
    # call dealerStart method on dealerhand