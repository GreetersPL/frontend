require 'initialize'

document.write '<div id="ember-testing"></div>'
App.LOG_TRANSITIONS = false  # basic logging of successful transitions
App.LOG_TRANSITIONS_INTERNAL = false  # detailed logging of all routing steps
App.rootElement = '#ember-testing'
App.setupForTesting()
App.injectTestHelpers()
mocha.setup("bdd");
chai.should()
afterEach(->
  App.reset()         
)