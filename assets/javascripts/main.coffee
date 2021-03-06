$           = require 'jquery'
Ember       = require 'ember'
Handlebars  = require 'handlebars'
DS          = require 'emberdata'
Bootstrap   = require 'bootstrap'
_           = require 'lodash'
Templates   = require './templates'
datepicker  = require 'datepicker'
config 		= require 'config'

window.App = Ember.Application.create(
  apiUrl: config.apiUrl
  rootElement: "div#app"
)

require './app/router'
App.Router.reopen(
  location: config.location
)
Ember.LinkView.reopen(
  attributeBindings: ["itemprop"]
)
require './app/store'
require './app/adapters'
require './app/objects'

require './app/controllers'
require './app/views'
require './app/models'
require './app/routes'
require './app/fixtures'
App
