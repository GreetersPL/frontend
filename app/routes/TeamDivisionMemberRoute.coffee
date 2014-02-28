module.exports = App.TeamDivisionMemberRoute = Ember.Route.extend
  model: (params)->
    @.store.find('member', name: params.name).then((member)->
      member.get('firstObject')
    )
    
    
