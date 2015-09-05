class window.CardView extends Backbone.View
  className: 'card'

  # template: _.template '<%= rankName %> of <%= suitName %>' ** original code **
  template: _.template ''

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed' 

# url = img/cards/ string interpolation of rankname and suitName .png
  # use this url to render the $el.css
    testurl = "url('img/cards/#{@model.get('rankName')}-#{@model.get('suitName')}.png')"

    @$el.css({
      'background-image': testurl,
      'background-size': 100, 100,
      'background-repeat': 'no-repeat'
    })