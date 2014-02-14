((window, document, variableName, scriptElement, firstScript) ->
  window['GoogleAnalyticsObject'] = variableName
  window[variableName] or (window[variableName] = ->
    (window[variableName].q = window[variableName].q or []).push arguments
    return
  )
  window[variableName].l = +new Date
  scriptElement = document.createElement('script')
  firstScript = document.scripts[0]

  scriptElement.src = '//www.google-analytics.com/analytics.js'
  firstScript.parentNode.insertBefore scriptElement, firstScript
  return
) window, document, 'ga'
ga 'create', 'UA-41080159-1', 'seandrickson.com'
ga 'send', 'pageview'