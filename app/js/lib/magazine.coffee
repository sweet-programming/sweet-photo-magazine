$ () ->
  currentPage = 0

  $(window).ready () ->
    $('#magazine').turn
      display: 'single'
      acceleration: true
      gradients: !$.isTouch
      elevation:50
      when:
        turned: (e, page) ->
          currentPage = page - 1
    $('#magazine').css(position: "fixed")

  height = $(document).height()
  width = $(document).width()
  $('#scroll-pane').height(height * 5 - 10)
  $('#magazine').width(width)
  $('#magazine').height(height)
  $('#magazine > div').width(width)
  $('#magazine > div').height(height)

  $(document).scroll (event) ->
    return if $(window).scrollTop() < 0

    pos = Math.floor($(window).scrollTop() / height)

    diff = pos - currentPage
    if diff > 0
      for i in [1..diff]
        if currentPage < 3
          currentPage += 1
          $('#magazine').turn('next')

    if diff < 0 
      for i in [1..(-diff)]
        if currentPage > 0
          currentPage -= 1
          $('#magazine').turn('previous')
