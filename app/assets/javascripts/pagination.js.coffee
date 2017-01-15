jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_climbs_url = $('#infinite-scrolling a.next_page').attr('href')
      if more_climbs_url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').html('<p>Loading</p>')
        $.getScript more_climbs_url, ->
      return
  return
