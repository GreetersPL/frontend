module.exports = App.TeamCordinatorRoute = Ember.Route.extend
  model: ()->
    @.store.find('project', 1)
