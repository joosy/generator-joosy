Sugar  = require 'sugar'
assert = require 'assert'

describe 'Loading', ->

  ['app', 'layout', 'page', 'widget'].each (generator) ->
    it "of #{generator} works", ->
      app = require "../#{generator}"
      assert app?