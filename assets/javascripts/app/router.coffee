module.exports = App.Router.map ->
  @.route('who', {path: '/kto-to'})
  @.route('search', {path: '/szukaj'})
  @.route('signup', {path: '/zapiszsie'})
  @.route('faq')
  @.route('contact', {path: '/kontakt'})
