import config from require "lapis.config"

config "heroku", ->
  port os.getenv "PORT"
