Modernizr.load({
	test: '__proto__' in {},
	yep:  'js/vendor/zepto-1.0.min.js',
	nope: 'js/vendor/jquery-1.9.1.min.js'
},{
	test: Modernizr.mq('(min-width:0px)'),
	nope: 'js/vendor/selectivizr-1.0.2.min.js'
});