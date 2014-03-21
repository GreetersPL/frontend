module.exports = App.TeamIndexRoute = Ember.Route.extend
  model: ()->
    @.store.find('project', 1)
