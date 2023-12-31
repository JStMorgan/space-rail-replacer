rail_pictures_space = function(elems)
    local keys =
    {
      {"straight_rail", "horizontal", 64, 128, 0, 0, true},
      {"straight_rail", "vertical", 128, 64, 0, 0, true},
      {"straight_rail", "diagonal-left-top", 96, 96, 0.5, 0.5, true},
      {"straight_rail", "diagonal-right-top", 96, 96, -0.5, 0.5, true},
      {"straight_rail", "diagonal-right-bottom", 96, 96, -0.5, -0.5, true},
      {"straight_rail", "diagonal-left-bottom", 96, 96, 0.5, -0.5, true},
      {"curved_rail", "vertical-left-top", 192, 288, 0.5, 0.5},
      {"curved_rail", "vertical-right-top", 192, 288, -0.5, 0.5},
      {"curved_rail", "vertical-right-bottom", 192, 288, -0.5, -0.5},
      {"curved_rail", "vertical-left-bottom", 192, 288, 0.5, -0.5},
      {"curved_rail" ,"horizontal-left-top", 288, 192, 0.5, 0.5},
      {"curved_rail" ,"horizontal-right-top", 288, 192, -0.5, 0.5},
      {"curved_rail" ,"horizontal-right-bottom", 288, 192, -0.5, -0.5},
      {"curved_rail" ,"horizontal-left-bottom", 288, 192, 0.5, -0.5}
    }
    local res = {}
    for _ , key in ipairs(keys) do
      local part = {}
      dashkey = key[1]:gsub("_", "-")
      for _ , elem in ipairs(elems) do
        part[elem[1]] =
        {
          filename = string.format("__space-exploration-graphics__/graphics/entity/space-rail/sr/%s-%s-%s.png", dashkey, key[2], elem[2]),
          priority = elem.priority or "extra-high",
          flags = elem.mipmap and { "trilinear-filtering" } or { "low-object" },
          width = key[3],
          height = key[4],
          shift = {key[5], key[6]},
          variation_count = (key[7] and elem.variations) or 1,
          hr_version =
          {
            filename = string.format("__space-exploration-graphics__/graphics/entity/space-rail/hr/%s-%s-%s.png", dashkey, key[2], elem[2]),
            priority = elem.priority or "extra-high",
            flags = elem.mipmap and { "trilinear-filtering" } or { "low-object" },
            width = key[3]*2,
            height = key[4]*2,
            shift = {key[5], key[6]},
            scale = 0.5,
            variation_count = (key[7] and elem.variations) or 1
          }
        }
      end
      dashkey2 = key[2]:gsub("-", "_")
      res[key[1] .. "_" .. dashkey2] = part
    end
      res["rail_endings"] =
      {
         sheets =
         {
           {
             filename = "__space-exploration-graphics__/graphics/entity/space-rail/sr/rail-endings-background.png",
             priority = "high",
             flags = { "low-object" },
             width = 128,
             height = 128,
             hr_version =
             {
               filename = "__space-exploration-graphics__/graphics/entity/space-rail/hr/rail-endings-background.png",
               priority = "high",
               flags = { "low-object" },
               width = 256,
               height = 256,
               scale = 0.5
             }
           },
           {
             filename = "__base__/graphics/entity/rail-endings/rail-endings-metals.png",
             priority = "high",
             flags = { "trilinear-filtering" },
             width = 128,
             height = 128,
             hr_version =
              {
               filename = "__base__/graphics/entity/rail-endings/hr-rail-endings-metals.png",
               priority = "high",
               flags = { "trilinear-filtering" },
               width = 256,
               height = 256,
               scale = 0.5
             }
           }
         }
      }
    return res
  end