'use strict';

module.exports = App.Member = DS.Model.extend
  name: DS.attr('string')
  email: DS.attr('string')
  division: DS.belongsTo('division')
  about: DS.attr()