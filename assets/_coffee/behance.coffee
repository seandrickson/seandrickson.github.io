((document) ->
  element = document.createElement('script')
  script = document.scripts[0]
  element.src = "//www.behance.net/v2/users/seandrickson/projects\
      ?api_key=Am3dYZpehliXhXrGIB1Lq831ivWfmBQF\
      &callback=callback"
  script.parentNode.insertBefore element, script

  window.callback = (data) ->
    if data.http_code is 200
      htmlString = ''
      proj = data.projects
      loadingElement = document.getElementById('loading')
      for i of proj
        htmlString += "
          <div class='col-xs-6 col-md-3'>
            <a href='#{proj[i].url}' class='thumbnail'>
              <img src='#{proj[i].covers[404]}' alt='#{proj[i].name}'>
            </a>
          </div>"
      loadingElement.outerHTML = htmlString
      # else console.error data
    return
) document