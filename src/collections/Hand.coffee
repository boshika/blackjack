class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if @maxScore() > 21
      @trigger 'bust'

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  maxScore: -> 
    if @scores()[1] <= 21 then @scores()[1]
    else @scores()[0]
  
  #need a stand to triggr stand
  stand: -> @trigger 'stand'

  dealerStart: -> 
    @at(0).flip()
    while @maxScore() < 17 then @hit()

     
  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


