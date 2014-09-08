# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $('#bill_due_on').chosen()

  $("#bill_receiver_tokens").tokenInput "/clients.json",
    crossDomain: false
    prePopulate: $("#bill_receiver_tokens").data("pre")
    theme: "facebook"
    hintText: 'Type in a first name of client'
    noResultsText: 'No client found with given first name'
    preventDuplicates: true
    tokenLimit: 1

  $("input[id$='category_tokens']").tokenInput "/categories.json",
    crossDomain: false
    prePopulate: $("input[id$='category_tokens']").data("pre")
    theme: "facebook"
    hintText: 'Type in a name of category'
    noResultsText: 'No category found with given name'
    preventDuplicates: true
    tokenLimit: 1
#    onAdd: (item) ->
#      alert "Added " + toSource(item)
#      return
#    onDelete: (item) ->
#      alert "Deleted " + item.name
#      return