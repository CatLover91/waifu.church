db = require "lapis.db"
schema = require "lapis.db.schema"

import
  create_table, add_column, create_index, drop_index, drop_column
  from schema

{
  :boolean, :varchar, :integer, :text, :foreign_key, :double, :time, :numeric, :serial, :enum
} = schema.types

{
  [1496053055]: =>
    create_table "waifu", {
      {"id", serial}
      {"name", varchar}

      {"description", text null: true}

      {"created", time}
      {"updated", time
      "PRIMARY KEY {id}"
    }
    
    create_table "waifu_image", {
      {"id", serial}
      {"waifu_id", foreign_key}
      {"url", text}
      {"width": integer}
      {"height": integer}

      {"created": time}
      {"updated": time}

      "PRIMARY KEY {id}"
    }
