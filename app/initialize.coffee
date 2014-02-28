# ===== Config =====
window.App = require 'config/app'
require 'config/router'
require 'config/store'

# Load all modules in order automagically. Ember likes things to work this
# way so everything is in the App.* namespace.
folderOrder = [
  'initializers', 'adapters', 'mixins', 'routes', 'models', 'views', 'controllers',
  'helpers', 'templates', 'components', 'fixtures'
]

folderOrder.forEach (folder) ->
  # Go through the prefixes in order and rquire them
  window.require.list().filter((module) ->
    new RegExp("^#{folder}/").test(module)
  ).forEach((module) -> require(module))
$(document).off('.data-api')
