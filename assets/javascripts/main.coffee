$           = require 'jquery'
Ember       = require 'ember'
Handlebars  = require 'handlebars'
DS          = require 'emberdata'
Bootstrap   = require 'bootstrap'
_           = require 'lodash'
Templates   = require './templates'


window.App = Ember.Application.create(
  LOG_TRANSITIONS: yes  # basic logging of successful transitions
  LOG_TRANSITIONS_INTERNAL: yes  # detailed logging of all routing steps
  rootElement: "div#app"
)
#App.config 		= require 'config'
require './app/store'
require './app/adapters'
require './app/router'
require './app/controllers'
require './app/views'
require './app/models'
require './app/routes'
require './app/fixtures'

App