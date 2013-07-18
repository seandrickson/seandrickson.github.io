// jshint browser: true, devel: true
// @codekit-prepend 'vendor/flyjsonp.js'

FlyJSONP.get({
    url: 'http://www.behance.net/v2/users/seandrickson/projects',
    parameters: { api_key: 'Am3dYZpehliXhXrGIB1Lq831ivWfmBQF' },
    success: function(data) {
        window.onload = (function(data) {
            if (data.http_code === 200) {
                var d = document, k,
                    bpro = data.projects,
                    load = d.getElementById('loading'),
                    port = d.getElementById('portfolio');
                load.parentNode.removeChild(load);

                for (k in bpro) {
                    var div = d.createElement('div'),
                        a = d.createElement('a'),
                        img = d.createElement('img');

                    img.setAttribute('src', bpro[k].covers[404]);
                    img.setAttribute('alt', bpro[k].name);
                    a.appendChild(img);

                    a.setAttribute('href', bpro[k].url);
                    div.appendChild(a);

                    div.setAttribute('class', 'project one-fourth');
                    port.appendChild(div);
                }
            } else { this.error(data); }
        }(data));
    },
    error: function(error) {
        console.log(error);
    }
});
