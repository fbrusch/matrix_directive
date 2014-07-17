express = require 'express'
livereload = require 'express-livereload'

app = express()

livereload(app, config={watchDir: process.cwd()})

app.use "/static", express.static __dirname + "/public"

app.engine 'jade', require('jade').__express

app.get "/", (req, res) ->
    res.render (__dirname + "/index.jade")

app.listen 10000
