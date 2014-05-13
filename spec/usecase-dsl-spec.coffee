{WorkspaceView} = require 'atom'
UsecaseDsl = require '../lib/usecase-dsl'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "UsecaseDsl", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('usecase-dsl')

  describe "when the usecase-dsl:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.usecase-dsl')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'usecase-dsl:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.usecase-dsl')).toExist()
        atom.workspaceView.trigger 'usecase-dsl:toggle'
        expect(atom.workspaceView.find('.usecase-dsl')).not.toExist()
