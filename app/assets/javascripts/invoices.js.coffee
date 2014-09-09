# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    #alert $(this).toSource()
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    id = '#' + $("input[id$='category_tokens']").last().attr('id')
    $(id).tokenInput "/categories.json",
      crossDomain: false
      prePopulate: $(id).data("pre")
      theme: "facebook"
      hintText: 'Type in a name of category'
      noResultsText: 'No category found with given name'
      preventDuplicates: true
      tokenLimit: 1

  $('#invoice_invoice_due').chosen()

  $("#invoice_receiver_tokens").tokenInput "/clients.json",
    crossDomain: false
    prePopulate: $("#invoice_receiver_tokens").data("pre")
    theme: "facebook"
    hintText: 'Type in a first name of client'
    noResultsText: 'No client found with given first name'
    preventDuplicates: true
    tokenLimit: 1

  $("input[id$='invoice_category_tokens']").tokenInput "/categories.json",
    crossDomain: false
    prePopulate: $(this).data("pre")
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