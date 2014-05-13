$.getJSON(
  '//www.behance.net/v2/users/seandrickson/projects?callback=?',
  { api_key: 'Am3dYZpehliXhXrGIB1Lq831ivWfmBQF' },
  ( data ) ->
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
      return )
    $loading.replaceWith( htmlString )
    return )
