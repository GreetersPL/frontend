'use strict';

module.exports = App.Division = DS.Model.extend
  name: DS.attr('string')
  email: DS.attr('string')
  cordinator: DS.belongsTo('member',{async:true})
  members: DS.hasMany('member',{async:true})
