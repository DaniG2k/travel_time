jQuery ->
  $('select.dropdown').dropdown()
  
  $('.message .close').on 'click', ->
    $(this).closest('.message').transition('fade')
    return