module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    sass:
      dist:
        options:
          loadPath: ['vendor/stylesheets']
          style: 'compressed'
        files:
          'assets/stylesheets/styles.css': 'assets/stylesheets/screen.scss'

    coffee:
      compile:
        options:
          bare: true
        files:
          'assets/javascripts/coffee.js': 'assets/javascripts/app.js.coffee'

    watch:
      options:
        livereload: true
      sass:
        files: ['assets/stylesheets/**/*.scss']
        tasks: ['sass']
      coffeescript:
        files: ['assets/javascripts/**/*.coffee']
        tasks: ['coffee']
      markup:
        files: 'index.html'
        tasks: ['default']

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask('default', ['sass', 'coffee'])

