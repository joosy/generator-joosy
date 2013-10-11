Path    = require('path')
helpers = require('yeoman-generator').test

describe 'Resource', ->
  beforeEach (done) ->
    helpers.testDirectory Path.join(__dirname, "temp"), (err) =>
      return done(err)  if err
      @app = helpers.createGenerator("joosy:resource", ["../../resource"])
      done()

  describe 'having no namespace', ->
    it "creates expected files", (done) ->
      helpers.mockPrompt @app,
        name: 'test'

      @app.run {}, ->
        helpers.assertFiles ["app/javascripts/resources/test.coffee"]
        done()

  describe 'having namespace', ->
    it "creates expected files", (done) ->
      helpers.mockPrompt @app,
        name: 'test/test'

      @app.run {}, ->
        helpers.assertFiles ["app/javascripts/resources/test/test.coffee"]
        done()