module.exports = App.TeamDivisionIndexRoute = Ember.Route.extend
  model: ()->
    @modelFor('team.division')
