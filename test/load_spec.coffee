assert = require 'assert'

describe 'Loading', ->

  ['app', 'layout', 'page', 'widget'].forEach (generator) ->
    it "of #{generator} works", ->
      app = require "../#{generator}"
      assert app?