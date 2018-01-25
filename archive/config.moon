import config from require "lapis.config"

config {"development", "production"}, ->
  code_cache "off"
  daemon "off"
  notice_log "stderr"

  postgres ->
    backend: "pgmoon"
    database: "waifuchurch"

config "production", ->
  track_exceptions true
  code_cache "on"
  port 10005
  daemon "on"
  notice_log "logs/notice.log"
  logging false
  num_workers 3

  enable_https true
