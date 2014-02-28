module.exports = App.TeamDivisionCordinatorRoute = Ember.Route.extend
  model: ()->
      division = @.modelFor('team.division')
      cordinator = division.get('cordinator').then((cordinator)=>
        @.store.find('member', cordinator.get('id')).then((member)=>
          name = member.get('name')
          @.transitionTo('team.division.member', name)
        )
      )
