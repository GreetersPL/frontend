module.exports = App.TeamDivisionRoute = Ember.Route.extend
  model: (params)->
    params.division = params.division.toUpperCase()
    @.store.find('division', {name: params.division}).then((division)->
      division.get('firstObject')
    )

  
