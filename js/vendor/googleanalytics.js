// jshint expr: true, sub: true, asi: true
(function(window, document, strScript, url, variableName, scriptElement, firstScript) {
    window['GoogleAnalyticsObject'] = variableName;
    window[variableName] = window[variableName] || function() {
        (window[variableName].q = window[variableName].q || []).push(arguments)
    };
    window[variableName].l = 1 * new Date();
    scriptElement = document.createElement(strScript),
    firstScript = document.getElementsByTagName(strScript)[0];
    scriptElement.async = 1;
    scriptElement.src = url;
    firstScript.parentNode.insertBefore(scriptElement, firstScript)
})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');