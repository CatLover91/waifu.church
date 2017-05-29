lapis = require "lapis"

class extends lapis.Application
  layout: require "views.layout"

  [index: "/"]: =>
    "Welcome to Waifu.church! Runing on Lapis #{require "lapis.version"}!"
