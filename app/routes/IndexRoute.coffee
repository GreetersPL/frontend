module.exports = App.IndexRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('slider', @.store.find('slider'))
