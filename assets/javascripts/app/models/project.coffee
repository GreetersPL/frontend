'use strict';

module.exports = App.Project = DS.Model.extend
  cordinator: DS.belongsTo('member',{async:true})
  division: DS.hasMany('division',{async:true})
