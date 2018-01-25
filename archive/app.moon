lapis = require "lapis"
magick = require "magick"

class extends lapis.Application
  layout: require "views.layout"
  
  handle_404: =>
    status: 404, layout: false, "Not Found!"

  [index: "/"]: =>
    @html ->
      div class: "main-cont", ->
        h2, "waifu.church"
        p, "The Ultimate place of Worship"
      div class: "bg-cont"
      div class: "waifu-cont"

  [hori_image: "/:width[%d]/x"]: =>
    if tonumber(@params.width) > 1920
      status:422, layout:false, "Image too large!"
    else
      content_type: "image/png", layout:false, magick.thumb("http://moonscript.org/images/logo.png", "#{@params.width}x")
  
  [vert_image: "/x/:height[%d]"]: =>
    if tonumber(@params.height) > 1080
      status:422, layout:false, "Image too large!"
    else
      content_type: "image/png", layout: false, magick.thumb("https://moonscript.org/images/logo.png", "x#{@params.height}")

  [simple_image: "(/:name[a-zA-Z])/:width[%d](/:height[%d])"]: =>
    @params.width = tonumber @params.width

    unless @params.height
      @params.height = @params.width
    if true
      status:405, layout: false, "We haven't implemented this feature yet :>"
    elseif @params.width > 3500 or @params.height > 3500
      status: 422, layout: false, "Image too large!"
    else
      "simple image: name: #{@params.name}, width: #{@params.width}, height: #{@params.height}"

