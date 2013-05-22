// @codekit-prepend "vendor/jquery-1.9.1.min.js"
// @codekit-prepend "vendor/selectivizr-1.0.2.min.js"
// @codekit-prepend "vendor/respond-1.1.0.min.js"

// Behance Projects API call
$.getJSON('http://www.behance.net/v2/users/seandrickson/projects?callback=?', 
	{ api_key: 'Am3dYZpehliXhXrGIB1Lq831ivWfmBQF' })
.done(function(data){
	var bpro = data.projects,
		$projects = $('#portfolio'),
		$loading = $('#loading');
	$loading.remove();
	$.each(bpro, function(k,v){
		$projects.append('<div class="project one-fourth"><a href="' + bpro[k].url + '"><img class="project-photo" src="' + bpro[k].covers[202] + '" alt="' + bpro[k].name + '"></a></div>');
	});
});


// Analytics
(function(G,o,O,g,l){G.GoogleAnalyticsObject=O;G[O]||(G[O]=function(){(G[O].q=G[O].q||[]).push(arguments)});G[O].l=+new Date;g=o.createElement('script'),l=o.scripts[0];g.src='//www.google-analytics.com/analytics.js';l.parentNode.insertBefore(g,l)}(this,document,'ga'));

ga('create','UA-41080159-1','seandrickson.com');
ga('send','pageview');