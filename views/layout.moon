import Widget from require "lapis.html"

class Layout extends Widget
  head: =>
    meta charset: "UTF-8"

    link rel: "icon", type: "image/png", href: "/static/images/favicon.png"

    title ->
        text "Waifu.church"

    meta property: "og:site_name", content: "Waifu.church"
    meta property: "og:image", content: page_image

    meta property: "twitter:image", content: "/static/images/share-icon.jpg"

    link rel: "canonical", href: "https://waifu.church"

    meta property: "og:description", content: "The ultimate place of worship."
    meta name: "description", content: "The ultimate place of worship"

    meta name: "viewport", content: "width=device-width, initial-scale=1"
    
    link rel: "stylesheet", href: "static/main.css"
    link href: "//fonts.googleapis.com/css?family=Anonymous+Pro", rel: "stylesheet", type: "text/css"

  header: =>
    div class: "header"

  footer: =>
    div class: "footer"

  main: => @content_for "inner"

  all_js: =>
    script type: "text/javascript", src: "https://unpkg.com/moonjs/dist/moon.js"
    script type: "text/javascript", src: "/static/main.js"

  content: =>
    html_5 ->
      head ->
        @head!

      body ->
        @header!
        @main!
        @footer!
        @all_js!
