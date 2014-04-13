module.exports = App.Router.map ->
  @.route('who', {path: '/kto-to'})
  @.resource('team', {path: '/zespol'}, ()->
    @.route('cordinator', path: '/kordynator')
    @.resource('team.division', {path:'/:division'}, ()->
      @.route('cordinator', path: '/kordynator')
      @.route('member', path: '/:name')
    )
  )
  @.route('signup', {path: '/zapiszsie'})