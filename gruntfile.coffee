module.exports = (grunt) ->
  grunt.initConfig
    pkg : grunt.file.readJSON("package.json")
    coffee : 
      dev : 
        files : [
          expand : true
          dest : "public/javascript"
          cwd : "src/cs"
          src : "**/*.coffee"
          ext : ".js"
        ]
      express :
        options :
          bare : true
        files : [
          expand : true
          dest : "controllers/js"
          cwd : "controllers/cs"
          src : "**/*.coffee"
          ext : ".js"
        ]

    requirejs :
      build :
        options :
          baseUrl : "public/javascript/app"
          name : "app"
          out : "public/javascript/app/build.js"
          optimize : "none"

    uglify :
      options : 
        report : "min"
        preserveComments : no
      compile :
        files : [
          expand : true
          dest : "public/javascript/vendor"
          cwd : "src/vendor/js"
          src : "*.js"
          ext : ".js"
        ]

    clean :
      dev : 
        src : [
          "public/javascript", "public/stylesheets",
          "controllers/js"
        ]

    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-requirejs"
    grunt.loadNpmTasks "grunt-contrib-uglify"
    grunt.loadNpmTasks "grunt-contrib-clean"

    grunt.registerTask "default", [
      "coffee:dev"
      "coffee:express"
      "requirejs"
    ]
    grunt.registerTask "vendor", [ "uglify" ]
    grunt.registerTask "reset", [ "clean" ]
