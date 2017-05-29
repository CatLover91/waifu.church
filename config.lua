local config
config = require("lapis.config").config
return config("heroku", function()
  return port(os.getenv("PORT"))
end)
