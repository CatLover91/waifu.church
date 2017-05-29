lapis = require "lapis"
magick = require "magick"

class extends lapis.Application
  layout: require "views.layout"
  
  handle_404: =>
    status: 404, layout: false, "Not Found!"

  [index: "/"]: =>
    "Welcome to Waifu.church! Runing on Lapis #{require "lapis.version"}!"

  [simple_image: "(/:name[a-zA-Z])/:width[%d](/:height[%d])"]: =>
    @params.width = tonumber @params.width

    unless @params.height
      @params.height = @params.width

    if @params.width > 3500 or @params.height > 3500
      status: 422, layout: false, "Image to large!"
    else
      "simple image: X: #{@params.width}, Y: #{@params.height}"

  [labelled_image: "/:name[a-zA-Z]/:width[%d](/:height[%d])"]: =>
    @params.width = tonumber @params.width

    unless @params.height
      @params.height = @params.width
    
    if @params.width > 3500 or @params.height > 3500
      status: 422, layout: false, "Image to large!"
    else
      "labelled image: name: #{@params.name}, X: #{@params.width}, Y: #{@params.height}"
 
