{View} = require 'atom'

module.exports =
class UsecaseDslView extends View
  @content: ->
    @div class: 'usecase-dsl overlay from-top', =>
      @div "The UsecaseDsl package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "usecase-dsl:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "UsecaseDslView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
