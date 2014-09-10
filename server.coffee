express = require 'express'
livereload = require 'express-livereload'

PORT = process.env.PORT || 10000

app = express()

livereload(app, config={watchDir: process.cwd()})

app.use "/static", express.static __dirname + "/public"

app.engine 'jade', require('jade').__express

app.get "/", (req, res) ->
    res.render (__dirname + "/index.jade")

console.log "You can admire the matrix connecting to localhost, at port #{PORT}"
app.listen PORT
