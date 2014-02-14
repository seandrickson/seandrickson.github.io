module.exports = (grunt) ->

  require('load-grunt-tasks') grunt

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    paths:
      jade: file: 'index.jade'
      html: file: 'index.html'
      grunt: file: 'Gruntfile.coffee'
      bootstrap:
        folder: 'bower_components/bootstrap'
        less: '<%= paths.bootstrap.folder %>/less'
      less:
        folder: 'assets/_less'
        partials: '<%= paths.less.folder %>/partials'
        file: '<%= paths.less.folder %>/main.less'
      css:
        folder: 'assets/css'
        file: '<%= paths.css.folder %>/main.min.css'
      coffee:
        src: 'assets/_coffee'
        dest: 'assets/_js'

    connect: uses_defaults: {}

    jade: dist:
      options:
        pretty: true
      files: '<%= paths.html.file %>': '<%= paths.jade.file %>'

    less: dist:
      options:
        paths: ['<%= paths.less.partials %>', '<%= paths.bootstrap.less %>']
        compress: true
        cleancss: true
        sourceMap: true
        sourceMapFilename: '<%= paths.css.file %>.map'
        sourceMapRootpath: '<%= paths.css.folder %>'
      files: '<%= paths.css.file %>': '<%= paths.less.file %>'

    autoprefixer: dist:
      options: map: true
      files: '<%= paths.css.file %>'

    coffee: files:
      options: bare: true
      expand: true
      cwd: '<%= paths.coffee.src %>'
      src: '**/*.coffee'
      dest: '<%= paths.coffee.dest %>'
      ext: '.min.js'

    coffeelint:
      grunt: ['<%= paths.grunt.file %>']
      coffee: ['<%= paths.coffee.src %>/*.coffee']

    uglify: files:
      expand: true
      cwd: '<%= paths.coffee.dest %>'
      src: '**/*.js'
      dest: '<%= paths.coffee.dest %>'


    watch:
      grunt:
        files: ['<%= paths.grunt.file %>']
        tasks: ['coffeelint:grunt']

      jade:
        files: ['<%= paths.jade.file %>']
        tasks: ['jade']

      less:
        files: ['<%= paths.less.folder %>/**/*.less']
        tasks: ['less', 'autoprefixer']

      coffee:
        files: ['<%= paths.coffee.src %>/**/*.coffee']
        tasks: ['coffeelint:coffee', 'coffee', 'uglify', 'jade']

      livereload:
        files: ['<%= paths.html.file %>', '<%= paths.css.file %>']
        options: livereload: true

  grunt.registerTask 'default', ['connect', 'watch']