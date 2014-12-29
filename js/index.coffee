---
# Front matter comment to ensure Jekyll properly reads file.
---

$(document).ready( () ->
  $.ajax(
    dataType: 'jsonp',
    url: '//www.behance.net/v2/users/seandrickson/projects?api_key=Am3dYZpehliXhXrGIB1Lq831ivWfmBQF',
  ).done( ( data ) ->
    htmlString = ''
    proj = data.projects
    $loading = $('#loading')

    $.each( proj, ( i, item ) ->
      htmlString += "
        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
          <a href='#{item.url}' class='thumbnail thumbnail-nobg'>
            <img src='#{item.covers[404]}' alt='#{item.name}'>
          </a>
        </div>"
      return
    )
    $loading.replaceWith( htmlString )
    return
  )
  return
)

$('#contact-form').submit( (e) ->
  e.preventDefault()

  $form = $(this)
  $submit = $('#submit')
  $error = $('#error')

  if $form.find('#email').val() and $form.find('#message').val()
    $submit.addClass('loading')
    $.ajax(
      dataType: 'jsonp',
      url: '//getsimpleform.com/messages/ajax?form_api_token=6a43656553e83551f090588d3478cb98',
      data: $form.serialize(),
    ).done( (data) ->
      if data and data.success
        $error.addClass('hide-alert')
        $submit.addClass('loaded').removeClass('loading')

        setTimeout( () ->
          $submit.removeClass('loaded')
          return
        , 2000)
      return
    )
  else $error.removeClass('hide-alert')
  return
)
