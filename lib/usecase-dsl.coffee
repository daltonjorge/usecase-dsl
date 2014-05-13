UsecaseDslView = require './usecase-dsl-view'

module.exports =
  usecaseDslView: null

  activate: (state) ->
    @usecaseDslView = new UsecaseDslView(state.usecaseDslViewState)

  deactivate: ->
    @usecaseDslView.destroy()

  serialize: ->
    usecaseDslViewState: @usecaseDslView.serialize()
