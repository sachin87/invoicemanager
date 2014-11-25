# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $('#estimate_due_on').chosen()

  autofill_category_details = (item, text_box_id) ->
    prefix = text_box_id.split('_estimate')[0]
    quantity_id = '#' + prefix + '_quantity'
    $(quantity_id).val(item.quantity)
    rate_id = '#' + prefix + '_rate'
    $(rate_id).val(item.unit_price)
    amount_id = '#' + prefix + '_amount'
    $(amount_id).val(item.amount)

  $("#estimate_receiver_tokens").tokenInput "/clients.json",
    crossDomain: false
    prePopulate: $("#estimate_receiver_tokens").data("pre")
    theme: "facebook"
    hintText: 'Type in a first name of client'
    noResultsText: 'No client found with given first name'
    preventDuplicates: true
    tokenLimit: 1

  $("input[id$='estimate_category_tokens']").tokenInput "/categories.json",
    crossDomain: false
    prePopulate: $(this).data("pre")
    theme: "facebook"
    hintText: 'Type in a name of category'
    noResultsText: 'No category found with given name'
    preventDuplicates: true
    tokenLimit: 1
    onAdd: (item) ->
      text_box_id =  $(this).attr('id')
      autofill_category_details item, text_box_id
    onDelete: (item) ->
      console.log "Deleted " + item.name

  $('form.estimates').on 'click', '.add_fields', (event) ->
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
      onAdd: (item) ->
        text_box_id =  $(this).attr('id')
        autofill_category_details item, text_box_id
      onDelete: (item) ->
        console.log "Deleted " + item.name