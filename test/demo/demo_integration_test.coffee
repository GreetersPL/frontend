test "/", ->
  visit("/").then ->
    equal(find("buttons").length, 2, "There are two buttons")
