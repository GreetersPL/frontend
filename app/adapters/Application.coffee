module.exports = App.ApplicationAdapter = DS.FixtureAdapter.extend(
  queryFixtures: (records, query, type)->
    records.filter((record)=>
        for key, value of query
          value = @.capitaliseFirstLetter(value)
          if (record[key] isnt value) then return false
        true
    )
  capitaliseFirstLetter : (string) ->
    "#{string.charAt(0).toUpperCase()}#{string.slice(1)}"
)